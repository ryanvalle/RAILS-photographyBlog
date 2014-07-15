# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :text
#  address    :string(255)
#  body       :text
#  user_id    :integer
#  status     :integer
#  created_at :datetime
#  updated_at :datetime
#  image      :text
#

class Article < ActiveRecord::Base
	belongs_to :gallery
	belongs_to :user

	def to_param
		filter_address = address.gsub(/[\s]+/,"-").gsub(/[^\w-]+/, "")
		"#{id}-#{filter_address}"
	end
end
