# == Schema Information
#
# Table name: departments
#
#  id              :bigint           not null, primary key
#  division_id     :bigint           not null
#  nama_department :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Department < ApplicationRecord
  belongs_to :division
end
