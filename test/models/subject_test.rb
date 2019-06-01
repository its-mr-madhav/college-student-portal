# == Schema Information
#
# Table name: subjects
#
#  id            :bigint(8)        not null, primary key
#  code          :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  semester_id   :integer
#

require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
