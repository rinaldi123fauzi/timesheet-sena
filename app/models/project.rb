# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  nama_proyek :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  kategori    :string
#  start_date  :date
#  end_date    :date
#  kode_proyek :string
#
class Project < ApplicationRecord
  has_many :timesheet
  has_many :team_project
end
