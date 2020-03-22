class CreateProductPromises < ActiveRecord::Migration[6.0]
  def change
    create_table :product_promises do |t|
      t.integer :active_effect_id
      t.integer :product_id

      t.timestamps
    end
  end
end
