class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #assosiation
  has_many :reviews, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #relationships assosiation
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed

  #refile
  attachment :image

  #validate
  validates :name, :user_name, presence: true

  #guest users
  def self.guest
    find_or_create_by!(name: 'guest01', user_name: 'guest01', email: 'guest01@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
