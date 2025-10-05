class CreateProperties < ActiveRecord::Migration[8.0]
  enable_extension "pgcrypto"

  def change
    create_table :properties, id: :uuid do |t|
      t.integer :unique_id, null: false
      t.string :property_name, null: false
      t.string :address
      t.string :room_number
      t.integer :rent
      t.float :size
      t.string :type_of_property

      t.timestamps
    end
  end
end
