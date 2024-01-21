class MakeBattleLogBotEmptyOk < ActiveRecord::Migration[7.1]
  def change
    remove_reference :battle_logs, :bot, null: false, foreign_key: true
    add_reference :battle_logs, :bot, null: true, foreign_key: true
  end
end
