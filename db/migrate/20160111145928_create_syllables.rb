class CreateSyllables < ActiveRecord::Migration
  def change
    create_table :syllables do |t|
      t.string :content
      t.string :part

      t.timestamps null: false
    end
  end
end
