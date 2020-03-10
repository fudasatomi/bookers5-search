class SearchController < ApplicationController

  def search
  	table = params[:search_table]
  	method = params[:search_method]
    word = params[:search_word]
    if table == "User"
        @users = User.search(method,word)
    elsif table == "Book"
        @books = Book.search(method,word)
    end
    @book = Book.new
  end

end
