class FixSpellingUsername < ActiveRecord::Migration
  def change
    rename_column :users, :usernname, :username
  end
end
