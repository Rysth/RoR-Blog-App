class RenamePostsEnhanecToPost < ActiveRecord::Migration[7.1]
  def change
    rename_table  :posts_enhanceds, :posts
  end
end
