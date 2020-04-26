class AddAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, defautl: false
  end
end
