# == Schema Information
#
# Table name: subjects
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  code        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  semester_id :integer
#

require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
