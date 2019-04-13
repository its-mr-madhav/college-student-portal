# == Schema Information
#
# Table name: faculty_subjects
#
#  id         :bigint(8)        not null, primary key
#  faculty_id :integer
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FacultySubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
