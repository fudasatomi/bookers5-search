class SearchController < ApplicationController
	def search
		@books = Book.search(params[:search])
		redirect_to bookresult_path
	end

	def bookresult
		@book = Book.new
		@books = Book.search(params[:search])
	end
end
