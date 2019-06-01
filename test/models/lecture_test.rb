# == Schema Information
#
# Table name: lectures
#
#  id                 :bigint(8)        not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  faculty_id         :integer
#  faculty_subject_id :integer
#  time_table_id      :integer
#

require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
