class CreatePostsEnhanced < ActiveRecord::Migration[7.1]
  def change
    create_table :posts_enhanceds do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
