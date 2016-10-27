class BookingsController < ApplicationController
  def new
  	@flight = Flight.find_by(id: params['flight'])
  	@booking = Booking.new
  	params['passengers'].to_i.times { @booking.passengers.build }
  end

  def create
  	flight = Flight.find_by(id: params['flight'])
  	@booking = Booking.new(booking_params)
  	if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.thank_you_email(passenger, @booking).deliver_now!
      end
      redirect_to (@booking)
    else
      redirect_to '/'
    end
  end

  def show
    @booking = Booking.find_by(id: params['id'])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end