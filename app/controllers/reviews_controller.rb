class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = Review.all
  end

  def new_reviews
    @reviews = Review.all
  end

  def hot_reviews
    @reviews = Review.all
    @all_ranks = Review.find(Favorite.group(:review_id).order('count(review_id) desc').limit(9).pluck(:review_id))
  end

  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def new
    @review = Review.new(review_params)
    @review.user_id = current_user.id
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save!
      redirect_to review_path(@review.user_id)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
      redirect_to reviews_path
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:children_id]).children
  end

  private
  def review_params
    params.permit(:title, :body, :image, :user_id)
  end
end
