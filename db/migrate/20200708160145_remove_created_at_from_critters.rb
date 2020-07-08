class RemoveCreatedAtFromCritters < ActiveRecord::Migration[6.0]
  def change
    remove_column :critters, :created_at, :datetime
  end
end
