class AddGameIdToSyllable < ActiveRecord::Migration
  def change
    add_column :syllables, :game_id, :integer, index: true
  end
end
