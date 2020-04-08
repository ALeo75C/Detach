class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :brand_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
