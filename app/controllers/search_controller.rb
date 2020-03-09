class SearchController < ApplicationController

  def search
  	method = params[:search_method]
    word = params[:search_word]
    @books = Book.search(method,word)
    @book = Book.new
  end

end
