class FlightsController < ApplicationController

    def index
        @flight_options = Airport.all.map{ |flight| [ "#{flight.code}", flight.id]}
        @flight_time_options = Flight.all.map{ |flight| [ "#{flight.departure_time}", flight.id]}
    end

end
