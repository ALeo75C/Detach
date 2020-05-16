class CreateSkinTypeFactors < ActiveRecord::Migration[6.0]
  def change
    create_table :skin_type_factors do |t|
      t.integer :skin_type_id
      t.integer :active_effect_id
      t.boolean :necessity

      t.timestamps
    end
  end
end
