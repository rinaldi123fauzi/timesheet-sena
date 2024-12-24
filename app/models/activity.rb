# == Schema Information
#
# Table name: activities
#
#  id             :bigint           not null, primary key
#  disipline_id   :bigint           not null
#  nama_aktifitas :string
#  deskripsi      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Activity < ApplicationRecord
  belongs_to :disipline
  has_many :timesheet
end
