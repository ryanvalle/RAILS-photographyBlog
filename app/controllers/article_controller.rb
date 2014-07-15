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
		@exif = EXIFR::JPEG.new('public'+@article.gallery.attachment_url).to_hash
		process_exif(@exif)
		if @article.status == 1 || @article.status == 2 || signed_in?
			render 'show'
		else
			redirect_to article_index_path
		end
	end

	private
		def process_exif(exif_data)
			exif_data.delete(:orientation)
			exif_data.delete(:photometric_interpretation)
			exif_data.delete(:comment)
			exif_data.delete(:exposure_program)
			exif_data.delete(:bits)
			exif_data.delete(:image_width)
			exif_data.delete(:image_length)
			exif_data.delete(:bits_per_sample)
			exif_data.delete(:make)
			exif_data.delete(:width)
			exif_data.delete(:height)
			exif_data.delete(:x_resolution)
			exif_data.delete(:y_resolution)
			exif_data.delete(:resolution_unit)
			exif_data.delete(:ycb_cr_positioning)
			exif_data.delete(:subject_area)
			exif_data.delete(:subsec_time_original)
			exif_data.delete(:subsec_time_digitized)
			exif_data.delete(:color_space)
			exif_data.delete(:pixel_x_dimension)
			exif_data.delete(:pixel_y_dimension)
			exif_data.delete(:sensing_method)
			exif_data.delete(:white_balance)
			exif_data.delete(:scene_capture_type)
			exif_data.delete(:gps_latitude_ref)
			exif_data.delete(:gps_latitude)
			exif_data.delete(:gps_longitude_ref)
			exif_data.delete(:gps_longitude)
			exif_data.delete(:gps_altitude)
			exif_data.delete(:gps_time_stamp)
			exif_data.delete(:gps_dop)
			exif_data.delete(:gps_date_stamp)


			exif_data[:exposure_time] = exif_data[:exposure_time].to_i if exif_data[:exposure_time].present?

			exif_data[:f_number] = exif_data[:f_number].to_i if exif_data[:f_number].present?

			exif_data[:date_time] = exif_data[:date_time].in_time_zone("Pacific Time (US & Canada)").strftime('%h %d, %Y @ %l:%M %p') if exif_data[:date_time].present?

			exif_data[:date_time_original] = exif_data[:date_time_original].in_time_zone("Pacific Time (US & Canada)").strftime('%h %d, %Y @ %l:%M %p') if exif_data[:date_time_original].present?

			exif_data[:date_time_digitized] = exif_data[:date_time_digitized].in_time_zone("Pacific Time (US & Canada)").strftime('%h %d, %Y @ %l:%M %p') if exif_data[:date_time_digitized].present?
		end
end


