class AddSlugsToGameAndRace < ActiveRecord::Migration
  def change
    add_column :races, :slug, :string
    add_index :races, :slug, unique: true

    add_column :games, :slug, :string
    add_index :games, :slug, unique: true
  end
end
