class PassengerMailer < ApplicationMailer
    default from: "confirmation@example.com"

    def confirmation_email
        @passenger = Passenger.find(params[:id])
        @booking = Booking.find(params[:booking_id])
        @flight = Flight.find(params[:flight_id])
        mail(to: @passenger.email, subject: "Your flight has been booked!")
    end
end
