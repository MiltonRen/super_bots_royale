class CreateBattleLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :battle_logs do |t|
      t.references :arena, null: false, foreign_key: true
      t.references :bot, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
