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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
