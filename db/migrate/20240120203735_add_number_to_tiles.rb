class AddNumberToTiles < ActiveRecord::Migration[7.1]
  def change
    add_column :tiles, :number, :integer
  end
end
