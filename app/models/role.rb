# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  permissions :text
#  type        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Role < RoleCore::Role
  has_many :role_assignments, dependent: :destroy
  has_many :users, through: :role_assignments
end
