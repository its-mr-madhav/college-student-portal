# == Schema Information
#
# Table name: lectures
#
#  id                 :bigint(8)        not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  faculty_id         :integer
#  faculty_subject_id :integer
#  time_table_id      :integer
#

class Lecture < ApplicationRecord
  belongs_to :faculty_subject
  belongs_to :faculty, -> { where(role: 'faculty') }, class_name: "User", foreign_key: "faculty_id"
  belongs_to :time_table
  has_many :student_lectures, class_name: "StudentLecture", foreign_key: "lecture_id"
  has_many :students, through: :student_lectures
end
