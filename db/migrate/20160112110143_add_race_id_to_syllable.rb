class AddRaceIdToSyllable < ActiveRecord::Migration
  def change
    add_column :syllables, :race_id, :integer, index: true, null: false
  end
end
