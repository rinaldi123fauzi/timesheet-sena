# == Schema Information
#
# Table name: employees
#
#  id            :bigint           not null, primary key
#  id_pegawai    :string
#  nama          :string
#  tempat_lahir  :string
#  tanggal_lahir :date
#  alamat        :string
#  id_identitas  :string
#  nomor_telepon :string
#  email         :string
#  jabatan       :string
#  work_unit_id  :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
