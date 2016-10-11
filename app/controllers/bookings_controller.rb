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