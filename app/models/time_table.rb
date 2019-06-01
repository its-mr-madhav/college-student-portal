# == Schema Information
#
# Table name: time_tables
#
#  id         :bigint(8)        not null, primary key
#  days       :integer
#  period     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TimeTable < ApplicationRecord
  enum days: { sun: 0, mon: 1, tue: 2, wed: 3, thu: 4, fri: 5, sat: 6 }
  has_many :lectures
end
