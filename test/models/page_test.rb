# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :text
#  url        :text
#  type       :string(255)
#  parent     :string(255)
#  status     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
