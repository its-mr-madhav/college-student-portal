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
  has_many :subjects
  has_many :semesters
  accepts_nested_attributes_for :semesters, reject_if: :all_blank, allow_destroy: true
  has_one :hod, -> { where(hod: 'true') }, class_name: "User", foreign_key: "hod_department_id"

  def self.departments_without_hod
    self.select { |u| !u.hod }
  end
end
