class FlightsController < ApplicationController

  def show
    @flight = Flight.find(params[:id])
  end
  
  def index
    @flights = Flight.all
  end
end