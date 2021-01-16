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
    @review_comments = ReviewComment.all
    @tags = @review.tag_counts_on(:tags)
  end

  def new
    @review = Review.new(params[:id])
    @review.user_id = current_user.id
    @review.tag_list.add('awesome')     # タグを追加
    @review.tag_list.remove('awesome')  # タグを削除
    @category_parent_array = Category.category_parent_array_create

  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      ReviewCategory.maltilevel_category_create(
      @review,
      params[:parent_id],
      params[:children_id],
      params[:grandchildren_id]
    )
      redirect_to review_path(@review.review_id)
    else
      @category_parent_array = Category.category_parent_array_create
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

  def tag_show
    @tags = Review.tag_counts_on(:tags).order('count DESC')
      if @tag = params[:tag]
         @reviews = Review.tagged_with(params[:tag])
      end
  end


  private
  def review_params
    params.require(:review).permit(:item_name, :brand_name, :title, :body, :image, :user_id, :tag_list, { category_ids: [] })
  end

end
