class BuddiesController < ApplicationController
  def index
    @buddies = Buddy.all
    @buddies = Buddy.where.not(latitude: nil, longitude: nil)

    @markers = @buddies.map do |buddy|
      {
        lat: buddy.latitude,
        lng: buddy.longitude
      }
    end
  end

  def show
    @buddy = Buddy.find(params[:id])
    @booking = Booking.new
    @markers = [{ lat: @buddy.latitude, lng: @buddy.longitude }]
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.new(buddy_params)
    # build skills array from params
    array_skills = []
    array_skills << 'ruby' if params[:ruby] == 1
    array_skills << 'rails' if params[:rails] == 1
    array_skills << 'js' if params[:javascript] == 1
    array_skills << 'jquery' if params[:jquery] == 1
    array_skills << 'sql' if params[:sql] == 1
    array_skills << 'html' if params[:html] == 1
    array_skills << 'github' if params[:github] == 1
    array_skills << 'heroku' if params[:heroku] == 1

    @buddy.skills = array_skills

    @buddy.user = current_user
    if @buddy.save!
      redirect_to bookings_path
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
    params.require(:buddy).permit(:name, :location, :start_available_time, :end_available_time, :picture, :description)
  end
end
