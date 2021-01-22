class ReviewCategory < ApplicationRecord
  #assosiation
  belongs_to :review
  belongs_to :category

  #category setting
  def self.maltilevel_category_create(review, parent_id, children_id, grandchildren_id)
    if parent_id.present? && parent_id != '---'
      category = Category.find(parent_id)
      ReviewCategory.create(review_id: review.id, category_id: category.id)
    end

    if children_id.present? && children_id != '---'
      category = Category.find(children_id)
      ReviewCategory.create(review_id: review.id, category_id: category.id)
    end

    if grandchildren_id.present? && grandchildren_id != '---'
      category = Category.find(grandchildren_id)
      ReviewCategory.create(review_id: review.id, category_id: category.id)
    end
  end
end
