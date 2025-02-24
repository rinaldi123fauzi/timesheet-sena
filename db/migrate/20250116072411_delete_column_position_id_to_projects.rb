class DeleteColumnPositionIdToProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :position_id
  end
end
