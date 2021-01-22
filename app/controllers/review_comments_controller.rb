class ReviewCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find(params[:review_id])
    review_comment = current_user.review_comments.new(review_comment_params)
    review_comment.review_id = review.id
    if review_comment.save
      redirect_to review_path(review), notice: "コメントを投稿しました"
    else
      render :show
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @review_comment = ReviewComment.find(params[:id])
    @review_comment.destroy
      redirect_to review_path(@review), notice: "コメントを削除しました。"
  end

  private
  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end
