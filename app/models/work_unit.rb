# == Schema Information
#
# Table name: work_units
#
#  id         :bigint           not null, primary key
#  nama       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class WorkUnit < ApplicationRecord
end
