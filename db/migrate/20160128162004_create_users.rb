class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    
    create_table :users do |t|
      t.hstore :location
      t.string :name
      t.string :email
      t.string :venmo_token
      t.string :password_digest
      t.string :phone
      t.integer :score

      t.timestamps null: false
    end
  end
end
