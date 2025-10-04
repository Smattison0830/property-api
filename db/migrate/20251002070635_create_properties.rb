class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.integer :unique_id, null: false
      t.string :property_name, null: false
      t.string :address
      t.string :room_number
      t.integer :rent
      t.float :size
      t.integer :type_of_property

      t.timestamps
    end
  end
end
