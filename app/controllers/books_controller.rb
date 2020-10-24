class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).order("average_rating DESC")
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @books = Book.where("title LIKE ?", wildcard_search)
  end
end
