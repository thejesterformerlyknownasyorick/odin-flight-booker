include ActionView::Helpers::TextHelper

class FlightsController < ApplicationController

    def index
        @flight_options = Airport.all.map{ |flight| [ "#{flight.code}", flight.id]}
        @flight_time_options = Flight.select(:date).group('DATE(date)')
                                     .map{ |f| [ f.searchable_date, f.date.to_date ]}
        @num_options = [1,2,3,4,5].map{ |num| [pluralize(num, 'passenger'), num ]}
        @num_passengers = params[:num_passengers] unless params[:num_passengers].nil?

        @flight_search_results = []
        if !params[:departure_id].nil?
            @flight_search_results = Flight.all
            @flight_search_results = @flight_search_results.where(departure_id: params[:departure_id])
            @flight_search_results = @flight_search_results.where(arrival_id: params[:arrival_id])
            @flight_search_results = @flight_search_results.where(date: params[:date])
        end
    end

end
