# == Schema Information
#
# Table name: team_projects
#
#  id         :bigint           not null, primary key
#  project_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pm         :string
#
class TeamProject < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
