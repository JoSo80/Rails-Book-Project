class Book < ApplicationRecord
  belongs_to :publisher

  validates :title, :author, :publication_year, :average_rating, presence: true
  validates :title, uniqueness: true
  validates :publication_year, :average_rating, numericality: true
end
