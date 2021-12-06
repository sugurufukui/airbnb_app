class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :description
      t.string :image_user

      t.timestamps
    end
    add_index :users, [:email]
  end
end
