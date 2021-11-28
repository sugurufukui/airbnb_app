class RemoveImageUserInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :image_user, :string
  end
end
