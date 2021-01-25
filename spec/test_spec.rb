require 'rails_helper'

#model tests
RSpec.describe User, type: :model do
  it "名前、ユーザーネーム、メール、パスワードがある場合、有効である" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "名前がない場合、無効である" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "ユーザーネームがない場合、無効である" do
    user = FactoryBot.build(:user, user_name: nil)
    user.valid?
    expect(user.errors[:user_name]).to include("can't be blank")
  end

  it "メールアドレスがない場合、無効である"  do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "パスワードがない場合、無効である" do
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end


RSpec.describe Review, type: :model do
  it "タイトル、本文がある場合有効である" do
    review = FactoryBot.build(:review)
    expect(review).to be_valid
  end

  it "タイトルがない場合、無効である" do
    review = FactoryBot.build(:review, title: nil)
    review.valid?
    expect(review.errors[:title]).to include("can't be blank")
  end

  it "本文がない場合、無効である" do
    review = FactoryBot.build(:review, title: nil)
    review.valid?
    expect(review.errors[:title]).to include("can't be blank")
  end
end


#controller tests
RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:another_user)
    @review = FactoryBot.create(:review)

    describe "#index" do
      it "正常なレスポンスか？" do
        get :index
        expect(response).to be_success
      end
      it "200レスポンスが返ってきているか？" do
        get :index
        expect(response).to have_http_status "200"
      end
    end

    describe "#show" do
      it "正常なレスポンスか？" do
        get :show, params: {id: id}
        expect(response).to be_success
      end
      it "200レスポンスが返ってきているか？" do
        get :show, params: {id: id}
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#following" do
    before do
      @user = FactoryBot.create(:user)
      it "正常なレスポンスか？" do
        get :following, params: {id: id}
        expect(response).to be_success
      end
      it "200レスポンスが返ってきているか？" do
        get :following, params: {id: id}
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#followers" do
    before do
      @user = FactoryBot.create(:user)
      it "正常なレスポンスか？" do
        get :followers, params: {id: id}
        expect(response).to be_success
      end
      it "200レスポンスが返ってきているか？" do
        get :followers, params: {id: id}
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#edit" do
    before do
      @user = FactoryBot.create(:user)
      @user = User.find(params[:id])

      context "as an authorized user" do
        it "正常なレスポンスか？" do
          sign_in @user
          get :edit, params: {id: id}
          expect(response).to be_success
        end
        it "200レスポンスが返ってきているか？" do
          sign_in @user
          get :edit, params: {id: id}
          expect(response).to have_http_status "200"
        end
      end

      context "as an unauthorized user" do
      context "ゲストユーザーだった場合" do
        it "ログイン画面にリダイレクトされているか" do
          get :edit, params: {id: id}
          expect(response).to redirect_to "/users/sign_up"
        end
      end
    end
  end
end
end

#ReviewController tests

RSpec.describe ReviewsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:another_user)
    @review = FactoryBot.create(:review)
  end

    describe "#create" do
      before do
      @user = FactoryBot.create(:user)
      @another_user = FactoryBot.create(:another_user)
      @review = FactoryBot.create(:review)

        context "as an authorized user" do
         it "正常に投稿を作成できるか？" do
            sign_in @user
            expect {
              post :create, params: {
                review: {
                  title: "test",
                  body: "testtext",
                  user_id: 1
                }
              }
            }.to change(@user.reviews, :count).by(1)
          end

          it "投稿作成後に作成した投稿の詳細ページへリダイレクトされているか？" do
            sign_in @user
            post :create, params: {
              review: {
                title: "test",
                body: "testtext",
                user_id: 1
              }
            }
            expect(response).to redirect_to "/reviews/2"
          end
        end

        context "with invalid attributes" do
          it "不正な投稿を作成しようとすると、再度作成ページへリダイレクトされるか？" do
            sign_in @user
            post :create, params: {
            review: {
                title: nil,
                body: "testtext",
                user_id: 1
              }
            }
            expect(response).to redirect_to "/reviews/new"
          end
        end

        context "as a guest user" do
          it "ログイン画面にリダイレクトされているか？" do
            get :create
            expect(response).to redirect_to "/users/sign_in"
          end
        end
      end
    end

      describe "#edit" do
        before do
        @user = FactoryBot.create(:user)
        @another_user = FactoryBot.create(:another_user)
        @review = FactoryBot.create(:review)

        context "as an authorized user" do
          it "正常なレスポンスか？" do
            sign_in @user
            get :edit, params: {id: @review.id}
            expect(response).to be_success
          end
        end

        context "as an unauthorized user" do
          it "正常なレスポンスが返ってきていないか？" do
            sign_in @another_user
            get :edit, params: {id: @review.id}
            expect(response).to_not be_success
          end
        end

        context "as a guest user" do
          it "ログイン画面にリダイレクトされているか？" do
            get :edit, params: {id: @review.id}
            expect(response).to redirect_to "/users/sign_in"
          end
        end
      end
    end

     describe "#update" do
        before do
        @user = FactoryBot.create(:user)
        @another_user = FactoryBot.create(:another_user)
        @review = FactoryBot.create(:review)

        context "as an authorized user" do
          it "正常に投稿を更新できるか？" do
            sign_in @user
            review_params = {title: "title1"}
            patch :update, params: {id: @review.id, review: review_params}
            expect(@review.reload.title).to eq "title1"
          end

          it "投稿を更新した後、更新された投稿の詳細ページへリダイレクトするか？" do
            sign_in @user
            review_params = {title: "title1"}
            patch :update, params: {id: @review.id, review: review_params}
            expect(response).to redirect_to "/reviews/1"
          end
        end

        context "as an unauthorized user" do
          it "正常なレスポンスが返ってきていないか？" do
            sign_in @another_user
            get :edit, params: {id: @review.id}
            expect(response).to_not be_success
          end

          it "他のユーザーが投稿を編集しようとすると、ルートページへリダイレクトされているか？" do
            sign_in @another_user
            get :edit, params: {id: @review.id}
            expect(response).to redirect_to "/users/sign_in"
          end
        end

        context "as a guest user" do
         it "ログイン画面にリダイレクトされているか？" do
           review_params = {
             title: "test",
             body: "testtext",
              user_id: 1
            }
            patch :update, params: {id: @review.id, review: review_params}
            expect(response).to redirect_to "/users/sign_in"
          end
        end
      end
    end

    describe "#destroy" do
      before do
        @user = FactoryBot.create(:user)
        @another_user = FactoryBot.create(:another_user)
        @review = FactoryBot.create(:review)

        context "as an authorized user" do
          it "正常に投稿を削除できるか？" do
            sign_in @user
            expect {
              delete :destroy, params: {id: @review.id}
            }.to change(@user.reviews, :count).by(-1)
          end

        it "投稿を削除した後、レビュー一覧ページへリダイレクトしているか？" do
          sign_in @user
          delete :destroy, params: {id: @review.id}
          expect(response).to redirect_to reviews_path
        end
      end

      context "as an unauthorized user" do
        it "投稿を投稿したユーザーだけが、投稿を削除できるようになっているか？" do
          sign_in @user
          another_review = @another_user.reviews.create(
            title: "test",
            body: "testtext"
          )
          expect {
            delete :destroy, params: {id: another_review.id}
          }.to_not change(@another_user.reviews, :count)
        end

        it "他のユーザーが投稿を削除しようとすると、ルートページへリダイレクトされるか？" do
          sign_in @user
          another_review = @another_user.reviews.create(
           title: "test",
           body: "testtext"
         )
          delete :destroy, params: {id: another_review.id}
          expect(response).to redirect_to "/users/sign_in"
        end
      end

      context "as a guest user" do
        it "ログイン画面にリダイレクトされているか？" do
          delete :destroy, params: {id: @review.id}
          expect(response).to redirect_to "/users/sign_in"
        end
      end
    end
  end
end