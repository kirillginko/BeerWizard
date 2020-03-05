class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :avatar, :avatar_cache, :remove_avatar

  has_many :reviews
  has_many :beers
  has_many :followers

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
