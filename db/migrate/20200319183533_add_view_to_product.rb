class AddViewToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :view, :string
  end
end
