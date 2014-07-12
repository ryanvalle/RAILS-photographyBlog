# == Schema Information
#
# Table name: galleries
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#  attachment :text
#

class Gallery < ActiveRecord::Base
	mount_uploader :attachment, ImageUploader
	validates :name, presence: true
	validates :attachment, presence: true

	has_many :articles
end
