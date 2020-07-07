class AddColumnsToCritters < ActiveRecord::Migration[6.0]
  def change
    add_column :critters, :nh_available_months, :integer, array: true
    add_column :critters, :sh_available_months, :integer, array: true
    add_column :critters, :available_times, :integer, array: true
  end
end
