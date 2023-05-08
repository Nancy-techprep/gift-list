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
end
