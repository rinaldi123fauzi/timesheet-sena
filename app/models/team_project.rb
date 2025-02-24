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
class TeamProject < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :timesheet
  belongs_to :disipline
  belongs_to :position
end
