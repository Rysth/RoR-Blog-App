class DeleteEmailField < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :email
  end
end
