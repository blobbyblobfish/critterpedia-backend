class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :hour
      t.string :weather
      t.string :url

      t.timestamps
    end
  end
end
