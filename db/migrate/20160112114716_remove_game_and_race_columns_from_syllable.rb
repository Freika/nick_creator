class RemoveGameAndRaceColumnsFromSyllable < ActiveRecord::Migration
  def change
    remove_column :syllables, :game, :string
    remove_column :syllables, :race, :string
  end
end
