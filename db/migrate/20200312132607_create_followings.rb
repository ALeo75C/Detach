class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :brand_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
