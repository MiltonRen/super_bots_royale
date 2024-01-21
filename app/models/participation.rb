# == Schema Information
#
# Table name: participations
#
#  id           :bigint           not null, primary key
#  attack       :integer
#  defense      :integer
#  is_alive     :boolean
#  is_winner    :boolean
#  item_holding :string
#  luck         :integer
#  speed        :integer
#  unicycle     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  arena_id     :bigint           not null
#  bot_id       :bigint           not null
#  tile_id      :bigint
#
# Indexes
#
#  index_participations_on_arena_id  (arena_id)
#  index_participations_on_bot_id    (bot_id)
#  index_participations_on_tile_id   (tile_id)
#
# Foreign Keys
#
#  fk_rails_...  (arena_id => arenas.id)
#  fk_rails_...  (bot_id => bots.id)
#  fk_rails_...  (tile_id => tiles.id)
#
class Participation < ApplicationRecord
  belongs_to :tile, optional: true
  belongs_to :bot
  belongs_to :arena

  attribute :is_alive, :boolean, default: true
  attribute :is_winner, :boolean, default: false

  attribute :attack, :integer, default: 0
  attribute :defense, :integer, default: 0
  attribute :speed, :integer, default: 0
  attribute :luck, :integer, default: 0
  attribute :unicycle, :integer, default: 0

  def additional_power
    attack + defense + speed + luck + unicycle
  end
end
