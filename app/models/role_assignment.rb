# == Schema Information
#
# Table name: role_assignments
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  role_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RoleAssignment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :role, optional: true
end
