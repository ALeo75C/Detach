class CreateSkinFactors < ActiveRecord::Migration[6.0]
  def change
    create_table :skin_factors do |t|
      t.string :name

      t.timestamps
    end
  end
end
