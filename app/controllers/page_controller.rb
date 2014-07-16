class PageController < ApplicationController
	def index
		@articles = Article.all.limit(8).order("id DESC").where(status: 1)
	end

	def about
	end
end
