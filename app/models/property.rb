class Property < ApplicationRecord
    enum :type_of_property, {
        mansion: "マンション",
        apartment: "アパート",
        detached_house: "一戸建て"
    }

    after_initialize :ensure_id

    validates :unique_id, presence: true, uniqueness: true
    validates :property_name, presence: true
    # When house exists(一戸建て), room_number can be NULL
    validates :room_number, presence: true, unless: :detached_house?

    # Generates uuid on Property.new
    def ensure_id
        self.id ||= SecureRandom.uuid
    end

    # Create logic to check if id is same???
    # Currently only raises an error
    # Error message is: PG::UniqueViolation: ERROR:  duplicate key value violates unique constraint "properties_pkey" (ActiveRecord::RecordNotUnique)

end
