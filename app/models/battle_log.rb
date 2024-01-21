# == Schema Information
#
# Table name: battle_logs
#
#  id         :bigint           not null, primary key
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  arena_id   :bigint           not null
#  bot_id     :bigint
#
# Indexes
#
#  index_battle_logs_on_arena_id  (arena_id)
#  index_battle_logs_on_bot_id    (bot_id)
#
# Foreign Keys
#
#  fk_rails_...  (arena_id => arenas.id)
#  fk_rails_...  (bot_id => bots.id)
#
class BattleLog < ApplicationRecord
  belongs_to :arena
  belongs_to :bot, optional: true
end
