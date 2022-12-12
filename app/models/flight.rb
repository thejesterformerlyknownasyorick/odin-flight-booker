class Flight < ApplicationRecord
    belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_id"
    belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_id"
    has_many :bookings
    has_many :passengers, through: :bookings

    def searchable_date
            date.strftime("%m/%d/%Y")
    end
end
