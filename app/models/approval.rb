# == Schema Information
#
# Table name: approvals
#
#  id            :bigint           not null, primary key
#  loan_id       :bigint
#  approve_by    :string
#  approve_level :integer
#  date          :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Approval < ApplicationRecord
  belongs_to :loan
end
