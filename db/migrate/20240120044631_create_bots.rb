class CreateBots < ActiveRecord::Migration[7.1]
  def change
    create_table :bots do |t|
      t.string :name
      t.string :element
      t.string :description
      t.string :move_name
      t.string :catchphrase
      t.string :catchphrase_lose
      t.integer :attack
      t.integer :defense
      t.integer :speed

      t.timestamps
    end
  end
end
