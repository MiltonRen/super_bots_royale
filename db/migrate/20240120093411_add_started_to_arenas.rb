class AddStartedToArenas < ActiveRecord::Migration[7.1]
  def change
    add_column :arenas, :started, :boolean
  end
end
