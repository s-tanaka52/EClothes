class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer, notice: "フォローしました"
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer, notice: "フォローを解除しました"
  end

  def followings
     user = User.find(params[:user_id])
     @users = user.followings
  end

  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end
end
