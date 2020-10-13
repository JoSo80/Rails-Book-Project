class HomeController < ApplicationController
  def index
    @books = Book.includes(:publisher)
                 .order("average_rating DESC")
                 .limit(100)

    @publishers = Publisher.order_by_books
                           .limit(100)
  end
end
