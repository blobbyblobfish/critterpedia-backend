class AddGameIdToCritters < ActiveRecord::Migration[6.0]
  def change
    add_column :critters, :game_id, :integer
  end
end
