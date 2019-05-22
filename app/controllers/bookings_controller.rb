class BookingsController < ApplicationController
  def index
    bookings = Booking.all
    @bookings = bookings.select { |booking| booking.user == current_user }
    @my_bookings = current_user.buddies
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.buddy = Buddy.find(params[:buddy_id])
    @booking.user = current_user
    @days = @booking.end_date.mjd - @booking.start_date.mjd
    @booking.price = @days * @booking.buddy.price
    @booking.status = 'unbooked'
    if @booking.save
      redirect_to buddies_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user, :buddy)
  end
end
