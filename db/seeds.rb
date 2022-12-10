# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport::delete_all # DON'T EVER ACTUALLY DO THIS FOR A LIVE SITE
Flight::delete_all # NO REALLY DON'T EVER DO THIS
Airport.reset_pk_sequence # Force airtport.id to restart with 1 when re-seeding
Flight.reset_pk_sequence # And same for flights

airport = Airport.create([
    { code: "DFW" },
    { code: "ATL" },
    { code: "DEN" },
    { code: "ORD" },
    { code: "ORD" },
    { code: "LAX" },
    { code: "CLT" },
    { code: "SDO" },
    { code: "MCO" },
    { code: "JFK" }
])

def airport_randomizer(airport = nil)
    second_airport = Airport.all[rand(Airport.all.count)]
    if second_airport == airport
        airport_randomizer(airport)
    else
        return second_airport
    end
end

100.times do |i|
    flight = Flight.new
    flight.departure_id = airport_randomizer
    flight.arrival_id = airport_randomizer(flight.departure_id)
    flight.departure_time = Time.now + rand(525600).minutes
    flight.flight_duration = rand(60..600)
    flight.save
end