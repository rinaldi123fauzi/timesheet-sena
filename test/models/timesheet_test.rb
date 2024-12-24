# == Schema Information
#
# Table name: timesheets
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  team_project_id :bigint           not null
#  activity_id     :bigint           not null
#  man_hours       :decimal(, )
#  week            :integer
#  month           :integer
#  year            :integer
#  deskripsi       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tanggal         :date
#  parent_id       :integer
#  project_id      :bigint           not null
#
require "test_helper"

class TimesheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
