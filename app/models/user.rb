class User < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_title, :against => [:name, :email]

    multisearchable against: [
    :name,
    :email
  ]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessor :email, :password, :remember_me, :avatar, :avatar_cache, :remove_avatar
  has_one_attached :avatar
  acts_as_voter

  has_many :beers, through: :reviews
  has_many :reviews, dependent: :destroy


  has_many :active_friendships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy

  has_many :passive_friendships, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_friendships, source: :followed

  has_many :followers, through: :passive_friendships, source: :follower

  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
  following.include?(user)
  end
end
