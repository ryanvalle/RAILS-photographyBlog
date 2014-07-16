class AdminController < ApplicationController
	before_filter :signed_in_user, only: [:show, :new, :edit, :update,:create, :articles]

	def index
		if signed_in?
			redirect_to articles_admin_path
		end
	end

	def images
		@images = Gallery.paginate(page: params[:page], per_page: 10).order("id DESC")
	end

	def articles
		@articles = Article.paginate(page: params[:page], per_page: 10).order("id DESC")
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		article_new = Article.new(article_params)
		if article_new.save
			redirect_to admin_index_path
		else
			redirect_to root_path
		end
	end

	def update
		article_update = Article.find(params[:article][:id])
		if article_update.update_attributes(article_params)
			flash[:notice] = "#{article_update.title} was updated"
			redirect_to articles_admin_path
		else
			flash[:notice] = "Error saving"
			redirect_to edit_admin_path(article_update.id)
		end
	end

	def auth
		admin = User.find_by_name(params[:admin][:name])
		if admin && admin.authenticate(params[:admin][:password])
			flash[:success] = "Login Success"
			sign_in(admin)
			redirect_to admin_index_path
		else
			flash[:danger] = "Invalid username/password"
			sign_out
			redirect_to admin_index_path
		end
	end
	
	def signout
		sign_out
		redirect_to root_path
	end

	private
		def signed_in_user
			unless signed_in?
				store_location
				redirect_to admin_index_path
			end
		end

		def article_params
			params.require(:article).permit(:id, :title, :address, :body, :user_id, :status, :gallery_id, :exifshow)
		end
end
