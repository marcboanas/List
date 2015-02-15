# == Schema Information
#
# Table name: user_lists
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class UserListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
