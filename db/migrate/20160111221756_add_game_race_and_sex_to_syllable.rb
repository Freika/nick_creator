class AddGameRaceAndSexToSyllable < ActiveRecord::Migration
  def change
    add_column :syllables, :game, :string
    add_column :syllables, :race, :string
    add_column :syllables, :sex, :string
  end
end
