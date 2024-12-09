# == Schema Information
#
# Table name: projects
#
#  id           :bigint           not null, primary key
#  position_id  :bigint           not null
#  disipline_id :bigint           not null
#  nama_proyek  :string
#  tipe_proyek  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
