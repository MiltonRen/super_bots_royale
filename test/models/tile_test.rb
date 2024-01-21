# == Schema Information
#
# Table name: tiles
#
#  id         :bigint           not null, primary key
#  bg         :string
#  item       :string
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  arena_id   :bigint           not null
#
# Indexes
#
#  index_tiles_on_arena_id  (arena_id)
#
# Foreign Keys
#
#  fk_rails_...  (arena_id => arenas.id)
#
require "test_helper"

class TileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
