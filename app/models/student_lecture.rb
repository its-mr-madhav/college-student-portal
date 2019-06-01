# == Schema Information
#
# Table name: student_lectures
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lecture_id :integer
#  student_id :integer
#

class StudentLecture < ApplicationRecord
  belongs_to :student, -> { where(role: 'student') }, class_name: "User", foreign_key: "student_id"
  belongs_to :lecture
end
