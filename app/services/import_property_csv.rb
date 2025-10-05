require "csv"

class ImportPropertyCsv
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    rows = CSV.read(@file_path, headers: true, encoding: "UTF-8")

    # Only take the first 100 rows
    rows.first(100).each do |row|
      property_data = {
        unique_id:        row["ユニークID"],
        property_name:    row["物件名"],
        address:          row["住所"],
        room_number:      row["部屋番号"],
        rent:             row["賃料"],
        size:             row["広さ"],
        type_of_property: row["建物の種類"]
      }
      # def find_or_initialize_by(attributes, &block)
      #      find_by(attributes) || new(attributes, &block)
      # end

      # find_or_initialize_by does a search by attributes or creates a new object with attributes
      property = Property.find_or_initialize_by(unique_id: property_data[:unique_id])
      # Adds data from csv to object
      property.assign_attributes(property_data)
      # Saves object and raises error if not valid
      property.save!
    end
    Rails.logger.info("Import Property CSV has finished importing / updating from #{@file_path}")
  end
end
