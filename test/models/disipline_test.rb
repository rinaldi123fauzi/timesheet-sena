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
require "test_helper"

class DisiplineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
