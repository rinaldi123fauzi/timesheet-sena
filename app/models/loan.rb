# == Schema Information
#
# Table name: loans
#
#  id               :bigint           not null, primary key
#  user_id          :bigint
#  deskripsi        :string
#  jumlah           :integer
#  from_date        :date
#  to_date          :date
#  penanggung_jawab :string
#  status           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  inventory_id     :bigint
#
class Loan < ApplicationRecord
  belongs_to :inventory
  belongs_to :user
  belongs_to :software, optional: :true
  belongs_to :tool, optional: :true
end
