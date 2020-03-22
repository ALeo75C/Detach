class CreateActiveEffects < ActiveRecord::Migration[6.0]
  def change
    create_table :active_effects do |t|
      t.string :name

      t.timestamps
    end
  end
end
