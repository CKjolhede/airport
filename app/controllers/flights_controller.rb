class FlightsController < ApplicationController

  def show
    @flight = Flight.find(params[:id])
  end
  
  def index
    @flights = Flight.all
  end

  def edit
    @flight_id = params[:id]
    @flight = Flight.find(params[:id])
  end
end