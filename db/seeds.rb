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
    { code: "ONT" },
    { code: "LAX" },
    { code: "CLT" },
    { code: "SDO" },
    { code: "MCO" },
    { code: "JFK" }
])

14.times do |x|
    10.times do |y|
        10.times do |n|
            flight = Flight.new
            airport1 = Airport.find(n+1)
            airport2 = Airport.find(y+1)
            flight.departure_id = airport1.id
            flight.arrival_id = airport2.id
            if airport1.id == airport2.id
                flight.destroy
            else
                flight.date = Date.today + x.days
                flight.flight_duration = rand(60..600)
                flight.save
            end
        end
    end
end