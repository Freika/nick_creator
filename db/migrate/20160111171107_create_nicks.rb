class CreateNicks < ActiveRecord::Migration
  def change
    create_table :nicks do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
