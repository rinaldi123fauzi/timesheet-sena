class AddColumnTipeProyekToTeamProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :team_projects, :tipe_proyek, :string
  end
end
