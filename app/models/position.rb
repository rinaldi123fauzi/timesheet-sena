# == Schema Information
#
# Table name: positions
#
#  id           :bigint           not null, primary key
#  disipline_id :bigint           not null
#  nama_posisi  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Position < ApplicationRecord
  belongs_to :disipline
  has_many :team_project
end
