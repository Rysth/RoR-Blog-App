class RenameUsersIdToAuthorId < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :users_id, :author_id
  end
end
