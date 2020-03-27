class Beer < ApplicationRecord
  include PgSearch::Model
    pg_search_scope :search_title, :against => [:name, :beer_type, :style, :description, :brewery]

    multisearchable against: [
    :name,
    :beer_type,
    :style,
    :description,
    :brewery,
  ]

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_one_attached :photo
  has_one_attached :avatar
  acts_as_votable


def average_review
  if self.reviews.blank?
    return 0
  else
    return self.reviews.average(:stars).round(2)
  end
end
end
