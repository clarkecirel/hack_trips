class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  
  def index
    @trips = current_user.trips
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
      redirect_to new_trip_location_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trips_path
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private
    def trip_params
      params.require(:trip).permit(:name)
    end
    # don't just find by the Trip model or you may potentially be able to view other users accounts
    def set_trip
      @trip = current_user.trips.find(params[:id])
    end
end
