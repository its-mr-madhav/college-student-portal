# == Schema Information
#
# Table name: lectures
#
#  id                 :bigint(8)        not null, primary key
#  faculty_subject_id :integer
#  faculty_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Lecture < ApplicationRecord
  belongs_to :faculty_subject
  belongs_to :faculty, -> { where(role: 'faculty') }, class_name: "User", foreign_key: "faculty_id"
end
