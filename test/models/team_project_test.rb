# == Schema Information
#
# Table name: team_projects
#
#  id           :bigint           not null, primary key
#  project_id   :bigint           not null
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  pm           :string
#  disipline_id :bigint
#  position_id  :bigint
#  tipe_proyek  :string
#
require "test_helper"

class TeamProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
