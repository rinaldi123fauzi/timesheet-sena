class DeleteColumnTipeProyekToProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :tipe_proyek
  end
end
