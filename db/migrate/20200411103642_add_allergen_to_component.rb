class AddAllergenToComponent < ActiveRecord::Migration[6.0]
  def change
    add_column :components, :allergen, :boolean
  end
end
