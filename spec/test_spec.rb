require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }

  it "名前とユーザーネームとメールアドレスとパスワードがあれば登録できる" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "名前がなければ登録できない" do
    expect(FactoryBot.build(:user, name: "")).to_not be_valid
  end

  it "ユーザーネームがなければ登録できない" do
    expect(FactoryBot.build(:user, user_name: "")).to_not be_valid
  end

  it "メールアドレスがなければ登録できない" do
    expect(FactoryBot.build(:user, email: "")).to_not be_valid
  end

  it "パスワードがなければ登録できない" do
    expect(FactoryBot.build(:user, password: "")).to_not be_valid
  end
end


RSpec.describe Review, type: :model do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }


  # it "タイトルと本文があれば投稿できる" do
  #   expect(FactoryBot.create(:review)).to be_valid
  # end

  it "タイトルがなければ投稿できない" do
    expect(FactoryBot.build(:review, title: "")).to_not be_valid
  end

  it "本文がなければ投稿できない" do
    expect(FactoryBot.build(:review, body: "")).to_not be_valid
  end
end

RSpec.describe ReviewComment, type: :model do

  it "ユーザーがログインしていて、本文があれば投稿できる" do
    expect(FactoryBot.create(:reviewcomment)).to be_valid
  end

  it "ユーザーがログインしていなければ投稿できない" do
    expect(FactoryBot.build(:reviewcomment, user_id: "")).to_not be_valid
  end

  it "本文がなければ投稿できない" do
    expect(FactoryBot.build(:reviewcomment, comment: "")).to_not be_valid
  end
end
