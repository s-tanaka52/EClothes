class ReviewComment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  #validation
  validates :comment, presence: true

end
