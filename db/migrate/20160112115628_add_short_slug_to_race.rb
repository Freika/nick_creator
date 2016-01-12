class AddShortSlugToRace < ActiveRecord::Migration
  def change
    add_column :races, :short_slug, :string, index: true
  end
end
