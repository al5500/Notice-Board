# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  suburb          :string
#  email           :string
#  phone           :text
#  image           :text
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string
#  admin           :boolean          default(FALSE)
#  address         :string
#  latitude        :float
#  longitude       :float
#

class User < ActiveRecord::Base

  has_many :notices
  has_secure_password
  validates :name, :presence => true
  validates :name, :uniqueness => true

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
