class Beer < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_one_attached :photo
  has_one_attached :avatar
end
