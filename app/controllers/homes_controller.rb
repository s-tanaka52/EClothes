class HomesController < ApplicationController
  def top
    #@hot_reviews = Favorite.group(:review_id).order('count(review_id) desc').limit(4).pluck(:review_id)
    @new_reviews = Review.all
    @all_ranks = Review.find(Favorite.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
  end

  def about
  end

  def enter
  end
end
