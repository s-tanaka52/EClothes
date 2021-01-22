class ReviewComment < ApplicationRecord
  #assosiation
  belongs_to :user
  belongs_to :review

  #validation
  validates :comment, presence: true

end
