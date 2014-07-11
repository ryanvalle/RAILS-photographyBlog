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
#

class Article < ActiveRecord::Base
end
