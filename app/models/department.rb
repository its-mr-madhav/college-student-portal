# == Schema Information
#
# Table name: departments
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ApplicationRecord
  has_many :users
  has_many :semesters
  accepts_nested_attributes_for :semesters, reject_if: :all_blank, allow_destroy: true
end
