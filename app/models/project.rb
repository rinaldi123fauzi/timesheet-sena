# == Schema Information
#
# Table name: projects
#
#  id           :bigint           not null, primary key
#  position_id  :bigint           not null
#  disipline_id :bigint           not null
#  nama_proyek  :string
#  tipe_proyek  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  kategori     :string
#
class Project < ApplicationRecord
  belongs_to :position
  belongs_to :disipline 
  has_many :timesheet
end
