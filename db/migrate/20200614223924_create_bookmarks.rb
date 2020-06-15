class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :profile_id
      t.integer :article_id

      t.timestamps
    end
  end
end
