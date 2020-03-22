class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.integer :component_id
      t.integer :active_effect_id

      t.timestamps
    end
  end
end
