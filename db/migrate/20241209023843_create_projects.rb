class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :position, null: false, foreign_key: true
      t.references :disipline, null: false, foreign_key: true
      t.string :nama_proyek
      t.string :tipe_proyek

      t.timestamps
    end
  end
end
