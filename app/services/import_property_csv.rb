require 'csv'

class ImportPropertyCsv
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    rows = CSV.read(@file_path, headers: true, encoding: 'UTF-8')

    # Only take the first 10 rows
    rows.first(1).each do |row|
      property_data = {
        unique_id:        row['ユニークID'],
        property_name:    row['物件名'],
        address:          row['住所'],
        room_number:      row['部屋番号'],
        rent:             row['賃料'],
        size:             row['広さ'],
        type_of_property: 1
      }

      Property.create!(property_data)
    end
  end
end
