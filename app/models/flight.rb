class Flight < ApplicationRecord
    belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_id"
    belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_id"

    def searchable_date
            departure_time.strftime("%m%d%Y")
    end
end
