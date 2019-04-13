# == Schema Information
#
# Table name: semesters
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#

class Semester < ApplicationRecord
  belongs_to :department
  has_many :users
  has_many :subjects
end
