class HomesController < ApplicationController

  def top
    @parents = Category.all.order("id ASC").limit(3)
    @hot_reviews = Favorite.group(:review_id).order('count(review_id) desc').limit(4).pluck(:review_id)
    @new_reviews = Review.all.order(created_at: :desc).limit(4)
    @all_ranks = Review.find(Favorite.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
  end

  def about
  end

  def enter
  end


end
