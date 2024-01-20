# == Schema Information
#
# Table name: arenas
#
#  id         :bigint           not null, primary key
#  concluded  :boolean
#  name       :string
#  started    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ArenaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
