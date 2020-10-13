class Book < ApplicationRecord
  belongs_to :publisher

  validates :title, :author, :publication_year, :number_of_pages, :average_rating, presence: true
  validates :title, uniqueness: true
  validates :publication_year, :number_of_pages, :average_rating, numericality: true
end
