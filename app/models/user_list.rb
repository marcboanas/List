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

class UserList < ActiveRecord::Base
  belongs_to :user
  has_many :user_list_items
  
  validates :title, length: { in: 4..120 }
  
  def to_json(options = {})
    options[:except] ||= [:id, :user_id, :created_at, :updated_at]
    super(options)
  end
end
