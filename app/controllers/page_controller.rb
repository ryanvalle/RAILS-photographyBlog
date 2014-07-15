class PageController < ApplicationController
	def index
		@articles = Article.all.limit(8).order("id DESC")
	end

	def about
	end
end
