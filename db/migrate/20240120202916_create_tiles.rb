class CreateTiles < ActiveRecord::Migration[7.1]
  def change
    create_table :tiles do |t|
      t.references :arena, null: false, foreign_key: true
      t.string :item

      t.timestamps
    end
  end
end
