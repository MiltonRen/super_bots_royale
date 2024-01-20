class AddFunStatsToBots < ActiveRecord::Migration[7.1]
  def change
    add_column :bots, :luck, :integer
    add_column :bots, :unicycle, :integer
  end
end
