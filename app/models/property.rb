class Property < ApplicationRecord
    enum type_of_property: {
        mansion: 0,
        apartment: 1,
        house: 2
    }

    validates :unique_id, presence: true
    validates :property_name, presence: true
    validates :room_number, presence: true, unless: :house?
end
