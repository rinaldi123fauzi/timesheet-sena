class AddColumnDisiplineIdToTeamProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :team_projects, :disipline, null: true, foreign_key: true
  end
end
