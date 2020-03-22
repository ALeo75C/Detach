class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :header
      t.text :content
      t.string :cover

      t.timestamps
    end
  end
end
