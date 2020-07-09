class RemoveNameFromSongs < ActiveRecord::Migration[6.0]
  def change
    remove_column :songs, :name, :string
  end
end
