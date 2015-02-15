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

class UserListItem < ActiveRecord::Base
  belongs_to :user_list
  
  def to_json(options = {})
    options[:except] ||= [:id, :list_id, :created_at, :updated_at]
    super(options)
  end
end
