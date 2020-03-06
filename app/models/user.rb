class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessor :email, :password, :remember_me, :avatar, :avatar_cache, :remove_avatar
  has_one_attached :avatar
  has_many :reviews, dependent: :destroy
  has_many :beers, through: :reviews
  #has_many :follows

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
