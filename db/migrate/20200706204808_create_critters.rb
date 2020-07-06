class CreateCritters < ActiveRecord::Migration[6.0]
  def change
    create_table :critters do |t|
      t.string :category
      t.string :name
      t.string :img_url

      t.timestamps
    end
  end
end
