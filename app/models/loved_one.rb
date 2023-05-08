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
end
