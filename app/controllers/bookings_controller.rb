class BookingsController < ApplicationController
	def index
		bookings = Booking.all
		@bookings = bookings.select { |booking| booking.user == current_user }
	end

	def create
		@booking = Booking.new(booking_params)
    @booking.buddy = Buddy.find(params[:buddy_id])
    @booking.user = current_user
    @booking.status = 'undone'
    if @booking.save
      redirect_to buddies_path
    else
      render :new
    end
	end

	private

	def booking_params
		params.require(:booking).permit(:start_date, :end_date)
	end
end
