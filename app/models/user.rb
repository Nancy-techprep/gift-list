# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string
#  gifts_count      :integer
#  loved_ones_count :integer
#  occasions_count  :integer
#  password_digest  :string
#  username         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
