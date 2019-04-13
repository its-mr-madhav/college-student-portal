# == Schema Information
#
# Table name: faculty_subjects
#
#  id         :bigint(8)        not null, primary key
#  faculty_id :integer
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FacultySubject < ApplicationRecord
  belongs_to :faculty, -> { where(role: 'faculty') }, class_name: "User", foreign_key: "faculty_id"
  belongs_to :subject
  has_many :lectures
end
