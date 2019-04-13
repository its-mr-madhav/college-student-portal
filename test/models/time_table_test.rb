# == Schema Information
#
# Table name: time_tables
#
#  id         :bigint(8)        not null, primary key
#  days       :integer
#  period     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lecture_id :integer
#

require 'test_helper'

class TimeTableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
