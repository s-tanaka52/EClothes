class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :following, :followers, :edit, :update]

  def mypage
    @user = current_user
    @reviews = @user.reviews.page(params[:page]).per(4)
    @favorites = Favorite.where(user_id: @user.id).page(params[:page]).per(4)
  end

  def index
    @users = User.page(params[:page]).per(6)
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.page(params[:page]).per(4)
    @reviews = Review.joins(:user).where(users: {id: @user.id})
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = User.page(params[:page]).per(6)
    @users = @user.followers
    render 'show_follower'
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      render :index
    end
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      redirect_to user_path(@user),notice: "ユーザ情報を編集しました"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
     redirect_to root_path, notice: "退会処理が完了しました"
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :introduction, :image, :height, :size)
  end
end
