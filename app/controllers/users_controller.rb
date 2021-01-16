class UsersController < ApplicationController
  #before_action :authenticate_user!

  def mypage
    @user = current_user
    @reviews = Review.all
  end

  def index
    @users = User.all
    @reviews = Review.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.joins(:user).where(users: {id: @user.id})
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
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
    if current_user.update(user_params)
      redirect_to users_my_page_path(@user)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
     redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :introduction, :image)
  end
end
