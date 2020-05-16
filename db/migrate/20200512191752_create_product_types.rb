class CreateProductTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_types do |t|
      t.integer :product_group_id
      t.integer :product_id
      t.string :name

      t.timestamps
    end
  end
end
