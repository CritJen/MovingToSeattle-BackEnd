class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.float :monthly_rent
      t.string :bedroom
      t.string :bathroom
      t.string :address

      t.timestamps
    end
  end
end
