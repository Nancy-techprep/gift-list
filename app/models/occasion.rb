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
end
