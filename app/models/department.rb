class Department < ApplicationRecord
  has_many :users
  has_many :semesters
  accepts_nested_attributes_for :semesters, reject_if: :all_blank, allow_destroy: true
end
