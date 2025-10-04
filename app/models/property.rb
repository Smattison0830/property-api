class Property < ApplicationRecord
    enum :type_of_property, {
        mansion: 0,
        apartment: 1,
        detached_house: 2
    }

    validates :unique_id, presence: true
    validates :property_name, presence: true
    # When house exists(一戸建て), room_number can be NULL
    validates :room_number, presence: true, unless: :detached_house?
end
