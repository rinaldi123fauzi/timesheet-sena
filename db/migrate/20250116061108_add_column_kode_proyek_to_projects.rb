class AddColumnKodeProyekToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :kode_proyek, :string
  end
end
