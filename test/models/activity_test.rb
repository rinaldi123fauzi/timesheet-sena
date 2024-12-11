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
require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
