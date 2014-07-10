class AdminController < ApplicationController
	before_filter :signed_in_user, only: [:show, :new, :edit, :update,:create]

	def index
	end

	def new
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
				redirect_to "#{root_url}"
			end
		end
end
