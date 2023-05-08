# == Schema Information
#
# Table name: occasions
#
#  id           :integer          not null, primary key
#  date         :date
#  gifts_count  :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  loved_one_id :integer
#  user_id      :integer
#
class Occasion < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })

  belongs_to(:loved_one, { :required => true, :class_name => "LovedOne", :foreign_key => "loved_one_id", :counter_cache => true })
  has_many(:gifts, { :class_name => "Gift", :foreign_key => "occasion_id", :dependent => :nullify })
end
