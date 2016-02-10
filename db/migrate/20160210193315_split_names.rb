class SplitNames < ActiveRecord::Migration
  def change
    remove_column :users, :full_name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end

end
