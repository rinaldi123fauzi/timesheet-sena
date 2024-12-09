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
require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
