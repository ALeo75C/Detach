class AddRoleToStructure < ActiveRecord::Migration[6.0]
  def change
    add_column :structures, :role, :sring
  end
end
