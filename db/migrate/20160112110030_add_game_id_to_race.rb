class AddGameIdToRace < ActiveRecord::Migration
  def change
    add_column :races, :game_id, :integer, index: true
  end
end
