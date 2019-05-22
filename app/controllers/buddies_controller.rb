class BuddiesController < ApplicationController
  def index
    @buddies = Buddy.all
  end

  def show
    @buddy = Buddy.find(params[:id])
    @booking = Booking.new
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.new(buddy_params)
    @buddy.user = current_user
    if @buddy.save!
      redirect_to buddy_path(@buddy)
    else
      render :new
    end
  end

  def destroy
    @buddy = Buddy.find(params[:id])
    @buddy.destroy
    redirect_to buddies_path
  end

  def edit
    @buddy = Buddy.find(params[:id])
  end

  def update
    @buddy = Buddy.find(params[:id])
    if @buddy.update(buddy_params)
      redirect_to buddy_path(@buddy)
    else
      render :edit
    end
  end

  def buddy_params
    params.require(:buddy).permit(:name, :location, :sex, :start_available_time, :end_available_time, :picture, :description, :age, :price)
  end
end
