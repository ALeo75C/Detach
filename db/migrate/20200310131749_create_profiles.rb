class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :user_id
      t.integer :skin_type_id
      t.integer :age
      t.string :avatar

      t.timestamps
    end
  end
end
