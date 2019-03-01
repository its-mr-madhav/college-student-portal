class FacultySubject < ApplicationRecord
  belongs_to :faculty, class_name: "User", foreign_key: "faculty_id"
  belongs_to :subject
end
