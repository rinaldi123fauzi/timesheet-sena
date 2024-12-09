class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.references :disipline, null: false, foreign_key: true
      t.string :nama_posisi

      t.timestamps
    end
  end
end
