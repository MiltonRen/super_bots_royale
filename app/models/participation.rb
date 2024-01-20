# == Schema Information
#
# Table name: participations
#
#  id           :bigint           not null, primary key
#  is_alive     :boolean
#  is_winner    :boolean
#  item_holding :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  arena_id     :bigint           not null
#  bot_id       :bigint           not null
#
# Indexes
#
#  index_participations_on_arena_id  (arena_id)
#  index_participations_on_bot_id    (bot_id)
#
# Foreign Keys
#
#  fk_rails_...  (arena_id => arenas.id)
#  fk_rails_...  (bot_id => bots.id)
#
class Participation < ApplicationRecord
  belongs_to :bot
  belongs_to :arena

  attribute :is_alive, :boolean, default: true
  attribute :is_winner, :boolean, default: false
end
