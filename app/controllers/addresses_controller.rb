class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  
  def index
    @addresses = @location.address
  end

  def show
  end

  def new
    @address = Address.new
  end
  
  def create
    @address = @location.address.new(address_params)
    if @address.save
      redirect_to trip_location_path(@location.trip_id, @location)
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @address.update(address_params)
      redirect_to location_addresses_path(@location)
    else
      render :edit
    end
  end
  
  def destroy
    @address.destroy
    redirect_to location_address_path(@location)
  end
  
  private
    def set_location
      @location = Location.find(params[:location_id])
    end

    def set_address
      @address = @location.address
    end

    def address_params
      params.require(:address).permit(:street, :city, :state, :zip)
    end  
end





