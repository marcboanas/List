# == Schema Information
#
# Table name: user_list_items
#
#  id              :integer          not null, primary key
#  description     :text
#  completed       :boolean
#  completion_date :datetime
#  user_list_id    :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class UserListItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
