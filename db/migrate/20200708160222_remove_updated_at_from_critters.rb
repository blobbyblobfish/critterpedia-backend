class RemoveUpdatedAtFromCritters < ActiveRecord::Migration[6.0]
  def change
    remove_column :critters, :updated_at, :datetime
  end
end
