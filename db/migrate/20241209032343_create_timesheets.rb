class CreateTimesheets < ActiveRecord::Migration[7.0]
  def change
    create_table :timesheets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team_project, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.decimal :man_hours
      t.integer :week
      t.integer :month
      t.integer :year
      t.string :deskripsi

      t.timestamps
    end
  end
end
