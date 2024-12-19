class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.date :tanggal_libur
      t.string :nama_libur
      t.boolean :status

      t.timestamps
    end
  end
end
