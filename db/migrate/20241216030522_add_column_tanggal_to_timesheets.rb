class AddColumnTanggalToTimesheets < ActiveRecord::Migration[7.0]
  def change
    add_column :timesheets, :tanggal, :date
  end
end
