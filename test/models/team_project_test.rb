# == Schema Information
#
# Table name: team_projects
#
#  id         :bigint           not null, primary key
#  project_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class TeamProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
