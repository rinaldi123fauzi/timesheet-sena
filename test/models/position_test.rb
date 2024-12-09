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
require "test_helper"

class PositionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
