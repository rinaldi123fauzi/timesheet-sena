# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_12_24_070848) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.bigint "disipline_id", null: false
    t.string "nama_aktifitas"
    t.string "deskripsi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disipline_id"], name: "index_activities_on_disipline_id"
  end

  create_table "approvals", force: :cascade do |t|
    t.bigint "loan_id"
    t.string "approve_by"
    t.integer "approve_level"
    t.datetime "date", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["loan_id"], name: "index_approvals_on_loan_id"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "division_id", null: false
    t.string "nama_department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["division_id"], name: "index_departments_on_division_id"
  end

  create_table "disiplines", force: :cascade do |t|
    t.bigint "division_id", null: false
    t.bigint "department_id", null: false
    t.string "nama_disiplin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_disiplines_on_department_id"
    t.index ["division_id"], name: "index_disiplines_on_division_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "nama_divisi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "id_pegawai"
    t.string "nama"
    t.string "tempat_lahir"
    t.date "tanggal_lahir"
    t.string "alamat"
    t.string "id_identitas"
    t.string "nomor_telepon"
    t.string "email"
    t.string "jabatan"
    t.bigint "work_unit_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["work_unit_id"], name: "index_employees_on_work_unit_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.date "tanggal_libur"
    t.string "nama_libur"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "kode"
    t.bigint "item_id"
    t.string "merek"
    t.date "tahun_perolehan"
    t.integer "harga_perolehan"
    t.integer "nilai_residu"
    t.date "masa_guna"
    t.string "lama_pakai"
    t.string "kondisi"
    t.string "lokasi"
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["item_id"], name: "index_inventories_on_item_id"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "nama_item"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "loans", force: :cascade do |t|
    t.bigint "user_id"
    t.string "deskripsi"
    t.integer "jumlah"
    t.date "from_date"
    t.date "to_date"
    t.string "penanggung_jawab"
    t.integer "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "inventory_id"
    t.index ["inventory_id"], name: "index_loans_on_inventory_id"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.bigint "disipline_id", null: false
    t.string "nama_posisi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disipline_id"], name: "index_positions_on_disipline_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "position_id", null: false
    t.bigint "disipline_id", null: false
    t.string "nama_proyek"
    t.string "tipe_proyek"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kategori"
    t.index ["disipline_id"], name: "index_projects_on_disipline_id"
    t.index ["position_id"], name: "index_projects_on_position_id"
  end

  create_table "role_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["role_id"], name: "index_role_assignments_on_role_id"
    t.index ["user_id"], name: "index_role_assignments_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.text "permissions"
    t.string "type", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "team_projects", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pm"
    t.index ["project_id"], name: "index_team_projects_on_project_id"
    t.index ["user_id"], name: "index_team_projects_on_user_id"
  end

  create_table "timesheets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_project_id", null: false
    t.bigint "activity_id", null: false
    t.decimal "man_hours"
    t.integer "week"
    t.integer "month"
    t.integer "year"
    t.string "deskripsi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "tanggal"
    t.integer "parent_id"
    t.bigint "project_id", null: false
    t.index ["activity_id"], name: "index_timesheets_on_activity_id"
    t.index ["project_id"], name: "index_timesheets_on_project_id"
    t.index ["team_project_id"], name: "index_timesheets_on_team_project_id"
    t.index ["user_id"], name: "index_timesheets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.string "username"
    t.boolean "state", default: true
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_units", force: :cascade do |t|
    t.string "nama"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "disiplines"
  add_foreign_key "approvals", "loans"
  add_foreign_key "departments", "divisions"
  add_foreign_key "disiplines", "departments"
  add_foreign_key "disiplines", "divisions"
  add_foreign_key "employees", "work_units"
  add_foreign_key "inventories", "items"
  add_foreign_key "inventories", "users"
  add_foreign_key "loans", "inventories"
  add_foreign_key "loans", "users"
  add_foreign_key "positions", "disiplines"
  add_foreign_key "projects", "disiplines"
  add_foreign_key "projects", "positions"
  add_foreign_key "role_assignments", "roles"
  add_foreign_key "role_assignments", "users"
  add_foreign_key "team_projects", "projects"
  add_foreign_key "team_projects", "users"
  add_foreign_key "timesheets", "activities"
  add_foreign_key "timesheets", "projects"
  add_foreign_key "timesheets", "team_projects"
  add_foreign_key "timesheets", "users"
end
