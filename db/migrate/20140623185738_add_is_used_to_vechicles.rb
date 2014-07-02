class AddIsUsedToVechicles < ActiveRecord::Migration
  def change
    add_column :vechicles, :is_used, :boolean
  end
end
