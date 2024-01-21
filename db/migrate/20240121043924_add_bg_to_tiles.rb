class AddBgToTiles < ActiveRecord::Migration[7.1]
  def change
    add_column :tiles, :bg, :string
  end
end
