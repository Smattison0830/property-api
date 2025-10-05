require "csv"

class ImportPropertyCsv
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    rows = CSV.read(@file_path, headers: true, encoding: "UTF-8")

    # TODO
    # Update call to first check in unique Id exists in database
    # If ID exists then update row with data from csv
    # else create new property in database(logic below)

    # Only take the first 10 rows
    rows.first(10).each do |row|
      property_data = {
        unique_id:        row["ユニークID"],
        property_name:    row["物件名"],
        address:          row["住所"],
        room_number:      row["部屋番号"],
        rent:             row["賃料"],
        size:             row["広さ"],
        type_of_property: row["建物の種類"]
      }

      Property.create!(property_data)
    end
  end
end
