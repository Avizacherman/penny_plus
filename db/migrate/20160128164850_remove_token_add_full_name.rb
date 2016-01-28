class RemoveTokenAddFullName < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    rename_column :users, :name, :usernname
    remove_column :users, :venmo_token
  end
end
