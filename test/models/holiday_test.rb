# == Schema Information
#
# Table name: holidays
#
#  id            :bigint           not null, primary key
#  tanggal_libur :date
#  nama_libur    :string
#  status        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class HolidayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
