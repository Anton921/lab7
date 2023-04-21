class AddColomnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :privider, :string
    add_column :users, :uid, :string
  end
end
