class CreateDisiplines < ActiveRecord::Migration[7.0]
  def change
    create_table :disiplines do |t|
      t.references :division, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.string :nama_disiplin

      t.timestamps
    end
  end
end
