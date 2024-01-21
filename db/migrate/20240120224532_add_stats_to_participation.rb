class AddStatsToParticipation < ActiveRecord::Migration[7.1]
  def change
    add_column :participations, :attack, :integer
    add_column :participations, :defense, :integer
    add_column :participations, :speed, :integer
    add_column :participations, :luck, :integer
    add_column :participations, :unicycle, :integer
  end
end
