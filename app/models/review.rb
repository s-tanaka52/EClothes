class Review < ApplicationRecord

  #association
  belongs_to :user, optional: true
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #through Category
  has_many :review_categories
  has_many :categories, through: :review_categories

  #refile
  attachment :image

  #tag generater
  acts_as_taggable

  #validation
  validates :title, :body, presence: true


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
