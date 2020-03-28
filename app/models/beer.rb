class Beer < ApplicationRecord
  include PgSearch::Model
    pg_search_scope :search_title, :against => [:name, :beer_type, :style, :description, :brewery, :abv, :pairing],
    using: { tsearch: { any_word: true } }

    multisearchable against: [
    :name,
    :beer_type,
    :style,
    :description,
    :brewery,
  ]

  # acts_as_taggable_on :beer_type
  # acts_as_taggable_on :style
  # acts_as_taggable_on :abv
  # acts_as_taggable_on :ibu
  # acts_as_taggable_on :brewery
  # acts_as_taggable_on :price

  $beertypes = ['american', 'ale', 'session', 'double','neipa', 'rye', 'gose', 'milkshake' ,'imperial', 'belgian']
  $styles = ['ipa', 'sour', 'stout', 'pale ale', 'brown ale', 'lager' , 'pilsner', 'saison', 'belgian', 'witbier']

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
