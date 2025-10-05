namespace :import do
    desc "Import properties from CSV"
    task properties: :environment do
      file_path = Rails.root.join('db', 'test_data', 'test_data.csv')
      ImportPropertyCsv.new(file_path).call
      puts "✅ Properties imported / updated successfully!"
    end
end