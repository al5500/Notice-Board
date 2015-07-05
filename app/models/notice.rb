# == Schema Information
#
# Table name: notices
#
#  id          :integer          not null, primary key
#  heading     :string
#  message     :text
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  cl_id       :string
#  date_from   :datetime
#  date_to     :datetime
#

class Notice < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
end
