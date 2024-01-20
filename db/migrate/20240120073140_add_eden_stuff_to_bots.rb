class AddEdenStuffToBots < ActiveRecord::Migration[7.1]
  def change
    add_column :bots, :image_task_id, :string
    add_column :bots, :image_link, :string
  end
end
