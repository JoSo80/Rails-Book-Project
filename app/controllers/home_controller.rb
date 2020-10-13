class HomeController < ApplicationController
  def index
    @books = Book.includes(:publisher)
                 .order("average_rating DESC")
                 .limit(10)

    @publishers = Publisher.limit(10)
  end
end
