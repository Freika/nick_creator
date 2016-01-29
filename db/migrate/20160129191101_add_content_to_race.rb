class AddContentToRace < ActiveRecord::Migration
  def change
    add_column :races, :content, :text
  end
end
