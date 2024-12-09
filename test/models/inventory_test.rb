# == Schema Information
#
# Table name: inventories
#
#  id              :bigint           not null, primary key
#  kode            :string
#  item_id         :bigint
#  merek           :string
#  tahun_perolehan :date
#  harga_perolehan :integer
#  nilai_residu    :integer
#  masa_guna       :date
#  lama_pakai      :string
#  kondisi         :string
#  lokasi          :string
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
