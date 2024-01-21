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
class Tile < ApplicationRecord
  has_many :participations
  belongs_to :arena

  before_create do
    self.bg = ["bg-base-100", "bg-base-200", "bg-base-300"].sample
  end

  def neighbors
    if number == 1
      [2, 11]
    elsif number == 10
      [9, 20]
    elsif number == 91
      [81, 92]
    elsif number == 100
      [90, 99]
    elsif [11, 21, 31, 41, 51, 61, 71, 81].include? number
      [number - 10, number + 10, number + 1]
    elsif [20, 30, 40, 50, 60, 70, 80, 90].include? number
      [number - 10, number + 10, number - 1]
    elsif [2, 3, 4, 5, 6, 7, 8, 9].include? number
      [number - 1, number + 1, number + 10]
    elsif [92, 93, 94, 95, 96, 97, 98, 99].include? number
      [number - 1, number + 1, number - 10]
    else
      [number - 1, number + 1, number - 10, number + 10]
    end
  end
end

