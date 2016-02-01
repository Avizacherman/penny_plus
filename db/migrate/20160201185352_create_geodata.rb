class CreateGeodata < ActiveRecord::Migration
  def change
    create_table :geodata do |t|
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
    add_reference :geodata, :user, index: true, foreign_key: true

  end
end
