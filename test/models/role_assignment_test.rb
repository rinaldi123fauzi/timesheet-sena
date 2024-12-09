# == Schema Information
#
# Table name: role_assignments
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  role_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class RoleAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
