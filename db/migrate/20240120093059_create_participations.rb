class CreateParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :participations do |t|
      t.references :bot, null: false, foreign_key: true
      t.references :arena, null: false, foreign_key: true
      t.string :item_holding
      t.boolean :is_alive
      t.boolean :is_winner

      t.timestamps
    end
  end
end
