class ChangeDefaultValueInPost < ActiveRecord::Migration[7.1]
  def change
    change_column_default :posts, :likes_counter, 0
    change_column_default :posts, :comments_counter, 0
  end
end