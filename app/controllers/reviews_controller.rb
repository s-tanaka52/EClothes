class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]

  def index
    @reviews = Review.page(params[:page]).per(8)
    if params[:tag]
      @reviews = Review.tagged_with("#{params[:tag]}")
    end
  end

  def new_reviews
    @reviews = Review.page(params[:page]).per(8).order(created_at: :desc)
  end

  def hot_reviews
    @reviews = Review.page(params[:page]).per(8)
    @all_ranks = Review.find(Favorite.group(:review_id).order('count(review_id) desc').limit(9).pluck(:review_id))
  end

  def show
    @review = Review.find(params[:id])
    #@review.review_comments.build
    @review_comment = ReviewComment.new
    @tags = @review.tag_counts_on(:tags)
    @category_id = @review.category_ids
    @categories = Category.find(@category_id)
    #@category_childs = @category_grandchilds.map { |category| category.parent }.compact
    #@category_parents = @category_childs.map { |category| category.parent }.compact
  end

  def new
    @review = Review.new(params[:id])
    @review.user_id = current_user.id
    @review.tag_list.add('awesome')
    @review.tag_list.remove('awesome')
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
      redirect_to review_path(@review.id)
    else
      @category_parent_array = Category.category_parent_array_create
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @review.user_id = current_user.id
    @review.tag_list.add('awesome')
    @review.tag_list.remove('awesome')
    @category_parent_array = Category.category_parent_array_create
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      ReviewCategory.maltilevel_category_create(
      @review,
      params[:parent_id],
      params[:children_id],
      params[:grandchildren_id]
    )
      redirect_to review_path(@review.id)
    else
      @category_parent_array = Category.category_parent_array_create
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
    params.require(:review).permit(:item_name, :brand_name, :rate , :title, :body, :image, :user_id, :tag_list, { category_ids: [] } )
  end
end
