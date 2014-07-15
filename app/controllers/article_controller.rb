class ArticleController < ApplicationController
	def index
		if signed_in?
			@articles = Article.paginate(page: params[:page], per_page: 10).order("id DESC")
		else 
			@articles = Article.paginate(page: params[:page], per_page: 10).where(status: 1).order("id DESC")
		end
	end

	def show
		@article = Article.find(params[:id])

		if @article.status == 1 || @article.status == 2 || signed_in?
			render 'show'
		else
			redirect_to article_index_path
		end
	end
end
