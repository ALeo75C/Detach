class CreatePersonalFactors < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_factors do |t|
      t.integer :user_id
      t.integer :skin_type_id

      t.timestamps
    end
  end
end
