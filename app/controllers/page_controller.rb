class PageController < ApplicationController
	def index
		@articles = Article.all.limit(5)
	end

	def about
	end
end
