# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  first_name          :string(255)
#  last_name           :string(255)
#  email               :string(255)
#  password_hash       :string(255)
#  password_salt       :string(255)
#  email_verification  :boolean
#  api_authtoken       :string(255)
#  authtoken_expiry    :datetime
#  provider            :string(255)
#  uid                 :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  verified_at         :datetime
#  reset_sent_at       :datetime
#  reset_digest        :string(255)
#  admin               :boolean
#  remember_digest     :string(255)
#  verification_digest :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
