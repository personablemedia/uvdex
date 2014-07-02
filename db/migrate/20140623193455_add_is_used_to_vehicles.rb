class AddIsUsedToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :is_used, :boolean
  end
end
