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
require "test_helper"

class DepartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
