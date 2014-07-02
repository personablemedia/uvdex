class AddPublishedToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :published, :boolean
  end
end
