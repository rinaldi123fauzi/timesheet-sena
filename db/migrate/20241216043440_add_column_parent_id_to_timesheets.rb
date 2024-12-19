class AddColumnParentIdToTimesheets < ActiveRecord::Migration[7.0]
  def change
    add_column :timesheets, :parent_id, :integer
  end
end
