class AddNewFieldsToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :package, :string
  end
end
