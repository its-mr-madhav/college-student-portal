class Semester < ApplicationRecord
  belongs_to :department
  has_many :users
  has_many :subjects
end
