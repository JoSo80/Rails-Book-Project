class HomeController < ApplicationController
  def index
    @books = Book.includes(:publisher)
                 .order("average_rating DESC")
                 .limit(10)

    @publishers = Publisher.order_by_books
                           .limit(10)
  end
end
