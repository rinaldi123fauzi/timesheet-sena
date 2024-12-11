# == Schema Information
#
# Table name: disiplines
#
#  id            :bigint           not null, primary key
#  division_id   :bigint           not null
#  department_id :bigint           not null
#  nama_disiplin :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Disipline < ApplicationRecord
  belongs_to :division
  belongs_to :department
  has_many :position
  has_many :project
  has_many :activity
end
