class BookingsController < ApplicationController
  def index
    bookings = Booking.all
    @bookings = bookings.select { |booking| booking.user == current_user }
    @my_buddies = current_user.buddies
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.buddy = Buddy.find(params[:buddy_id])
    @booking.user = current_user
    @booking.status = 'pending'

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to bookings_path
  end

  def validate
    @booking = Booking.find(params[:booking_id])
    @booking.status = 'validated'
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user, :buddy)
  end
end
