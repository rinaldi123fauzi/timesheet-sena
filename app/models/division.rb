# == Schema Information
#
# Table name: divisions
#
#  id          :bigint           not null, primary key
#  nama_divisi :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Division < ApplicationRecord
end
