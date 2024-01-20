class CreateArenas < ActiveRecord::Migration[7.1]
  def change
    create_table :arenas do |t|
      t.string :name
      t.boolean :concluded

      t.timestamps
    end
  end
end
