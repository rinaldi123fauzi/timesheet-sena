class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :disipline, null: false, foreign_key: true
      t.string :nama_aktifitas
      t.string :deskripsi

      t.timestamps
    end
  end
end
