# == Schema Information
#
# Table name: gifts
#
#  id           :integer          not null, primary key
#  note         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  loved_one_id :integer
#  occasion_id  :integer
#  user_id      :integer
#
class Gift < ApplicationRecord

  validates :user_id, :presence => true
  validates :loved_one_id, :presence => true

  # has_many(:gifts, { :class_name => "Gift", :foreign_key => "occasion_id", :dependent => :nullify })
  belongs_to(:occasion)
  belongs_to(:loved_one, { :required => true, :class_name => "LovedOne", :foreign_key => "loved_one_id", :counter_cache => true })
  belongs_to(:loved_one, { :required => true, :class_name => "LovedOne", :foreign_key => "loved_one_id", :counter_cache => true })
end
