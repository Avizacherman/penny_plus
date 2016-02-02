class ConvertLocationHashToTwoColumns < ActiveRecord::Migration
  def change
    remove_column :users, :location
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
