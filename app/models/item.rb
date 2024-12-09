# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  nama_item  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
    has_many :inventory
end
