class SearchController < ApplicationController

  def search
    @books = Book.search(params[:search])
    @book = Book.new
  end

end
