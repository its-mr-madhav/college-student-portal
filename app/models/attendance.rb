# == Schema Information
#
# Table name: attendances
#
#  id         :bigint(8)        not null, primary key
#  present    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lecture_id :integer
#  user_id    :integer
#

class Attendance < ApplicationRecord
  belongs_to :lecture
  belongs_to :user, -> { where(role: 'student') }, class_name: "User", foreign_key: "user_id"
end
