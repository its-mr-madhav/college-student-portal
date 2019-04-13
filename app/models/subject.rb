# == Schema Information
#
# Table name: subjects
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  code        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  semester_id :integer
#

class Subject < ApplicationRecord
  belongs_to :semester
  has_many :faculty_subjects
  has_many :faculties, through: :faculty_subjects
end
