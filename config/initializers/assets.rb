Rails.application.config.autoload_paths += %W(/app/models/ckeditor)

Rails.application.config.assets.precompile += Ckeditor.assets

Rails.application.config.assets.precompile += %w( 
	page.css 
	admin.css
	gallery.css
	fonts.css
	article.css
	ckeditor/*
)