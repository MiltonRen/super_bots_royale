class AddTileToParticipations < ActiveRecord::Migration[7.1]
  def change
    add_reference :participations, :tile, null: true, foreign_key: true
  end
end
