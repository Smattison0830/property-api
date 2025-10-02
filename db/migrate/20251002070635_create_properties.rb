class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.integer :unique_id
      t.string :property_name
      t.string :address
      t.string :room_number
      t.integer :rent
      t.float :size
      t.enum :type_of_property

      t.timestamps
    end
  end
end
