# == Schema Information
#
# Table name: loved_ones
#
#  id              :integer          not null, primary key
#  gifts_count     :integer
#  name            :string
#  occasions_count :integer
#  relationship    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class LovedOne < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })

  has_many(:occasions, { :class_name => "Occasion", :foreign_key => "loved_one_id", :dependent => :destroy })

  has_many(:gifts, { :class_name => "Gift", :foreign_key => "loved_one_id", :dependent => :destroy })
end
