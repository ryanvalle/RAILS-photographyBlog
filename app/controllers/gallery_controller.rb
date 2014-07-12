class GalleryController < ApplicationController
	def new 
		@image = Gallery.new
	end

	def create
		@image = Gallery.new(gallery_params)
		if @image.save
			redirect_to images_admin_path, notice: "Image #{@image.name} uploaded successfully"
		else 
			redirect_to new_gallery_path, notice: "ERROR UPLOADING FILES"
		end
	end

	def paginate(page)
	end

	def destroy
		@image = Gallery.find(params[:id])
		@image.destroy
		redirect_to images_admin_path, notice: "#{@image.name} was deleted"
	end

	private
		def gallery_params
			params.require(:gallery).permit(:name, :attachment)
		end
end
