module ApplicationHelper

	def custom_meta(data)
		p meta_description(data) +
			og_meta(data) +
			twitter_cards(data) 
	end

	def default_meta
		"<meta name='description' content='Technimg combines two words - technology & imaging. My goal with this blog is to share with a community of photographers, from hobbyists to professionals, some of the techniques used in the photos I have been taking. Many of these articles will come from a technical perspective, talking about camera settings, lighting, equipment, thought processes, and post-production (image processing) techniques which led to a given photo.'>"+
		"<meta property='og:description' content='Technimg combines two words - technology & imaging. My goal with this blog is to share with a community of photographers, from hobbyists to professionals, some of the techniques used in the photos I have been taking. Many of these articles will come from a technical perspective, talking about camera settings, lighting, equipment, thought processes, and post-production (image processing) techniques which led to a given photo.'>"+
			"<meta property='og:type' content='blog' .>"+
		"<meta property='og:image' content='http://www.technimg.com#{image_path("technimg_logo_sm.png")}'>"+
		"<meta property='og:url' content='http://www.technimg.com'>"
	end

	private 
		def meta_description(data)
			"<meta name='description' content='#{truncate(strip_tags(data.body), length: 150, ommission: '...')}'>"
		end

		def og_meta(data)
			"<meta property='og:title' content='#{truncate(strip_tags(data.body), length: 150, ommission: '...')}' >" +
			"<meta property='og:type' content='article' >" +
			"<meta property='og:image' content='http://www.technimg.com#{data.gallery.attachment_url}' >" +
			"<meta property='og:url' content='http://www.technimg.com#{show_article_path(data)}' >" +
			"<meta property='fb:admins' content='1039920113' />"
		end

		def twitter_cards(data)
			"<meta property='twitter:card' content='summary' >" +
			"<meta property='twitter:url' content='http://www.technimg.com#{show_article_path(data)}' >" +
			"<meta property='twitter:title' content='#{data.title}' >" +
			"<meta property='twitter:description' content='#{truncate(strip_tags(data.body), length: 150, ommission: '...')}' >" +
			"<meta property='twitter:image' content='http://www.technimg.com#{data.gallery.attachment_url}' >"
		end

end
