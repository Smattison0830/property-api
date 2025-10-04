class Property < ApplicationRecord
    enum :type_of_property, {
        mansion: 0,
        apartment: 1,
        detached_house: 2
    }

    after_initialize :ensure_unique_id

    validates :unique_id, presence: true
    validates :property_name, presence: true
    # When house exists(一戸建て), room_number can be NULL
    validates :room_number, presence: true, unless: :detached_house?

    private

      def ensure_unique_id
        self.unique_id ||= SecureRandom.uuid
      end
end
