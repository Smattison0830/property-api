# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_02_070635) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "type_of_property", ["アパート", "一戸建て", "マンション"]

  create_table "properties", force: :cascade do |t|
    t.integer "unique_id", null: false
    t.string "property_name"
    t.string "address"
    t.string "room_number"
    t.integer "rent"
    t.float "size"
    t.enum "type_of_property", null: false, enum_type: "type_of_property"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
