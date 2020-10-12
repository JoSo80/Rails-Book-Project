class BooksController < ApplicationController
  def index
    @books = Book.order("average_rating DESC")
  end

  def show; end
end
