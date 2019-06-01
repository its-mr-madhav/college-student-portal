# == Schema Information
#
# Table name: student_lectures
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lecture_id :integer
#  student_id :integer
#

require 'test_helper'

class StudentLectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
