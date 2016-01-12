class AddShortSlugToGame < ActiveRecord::Migration
  def change
    add_column :games, :short_slug, :string, index: true
  end
end
