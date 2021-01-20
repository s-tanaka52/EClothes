class AddReviewIdToReviewCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :review_categories, :review_id, :integer
  end
end
