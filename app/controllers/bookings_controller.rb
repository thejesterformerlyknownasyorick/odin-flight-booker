class BookingsController < ApplicationController

    def index
        @bookings = Booking.all
    end


    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_id])
        @num_passengers = params[:num_passengers].to_i
        @num_passengers.times { @booking.passengers.build }
    end

    def create
        @booking = Booking.new(booking_params)

        if @booking.save
            Passenger.where("booking_id = ?", @booking.id).each do |passenger|
                PassengerMailer.with(id: passenger.id, booking_id: @booking.id, flight_id: @booking.flight_id).confirmation_email.deliver_now!
            end
            redirect_to @booking
        else
            render 'new'
        end
    end

    def show
        @booking = Booking.find(params[:id])
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end
end
