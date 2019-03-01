class Subject < ApplicationRecord
  belongs_to :semester
  has_many :faculty_subjects
  has_many :faculties, through: :faculty_subjects
end
