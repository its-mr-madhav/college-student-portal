# == Schema Information
#
# Table name: attendances
#
#  id         :bigint(8)        not null, primary key
#  present    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lecture_id :integer
#  user_id    :integer
#

require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
