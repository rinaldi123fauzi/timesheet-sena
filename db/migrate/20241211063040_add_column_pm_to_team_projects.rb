class AddColumnPmToTeamProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :team_projects, :pm, :string
  end
end
