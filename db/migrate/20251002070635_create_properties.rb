class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    # enum types for type_of_property
    create_enum "type_of_property", [ "アパート", "一戸建て", "マンション" ]

    create_table :properties do |t|
      t.integer :unique_id, null: false
      t.string :property_name, null: false
      t.string :address
      t.string :room_number
      t.integer :rent
      t.float :size
      t.enum :type_of_property, enum_type: "type_of_property"

      t.timestamps
    end
  end
end
