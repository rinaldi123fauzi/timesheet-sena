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
class Inventory < ApplicationRecord
  has_many :loan
  belongs_to :item
  belongs_to :user, optional: true
  has_many_attached :foto_inventory
end
