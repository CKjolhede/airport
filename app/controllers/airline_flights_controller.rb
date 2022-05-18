class AirlineFlightsController < ApplicationController

  def index
    @airline = Airline.find(params[:id])
    @flights = @airline.flights
  end


  def create
    @airline = Airline.find(params[:id])
    @airline.flights.create(flight_params)
    redirect_to '/airlines'
  end



  private

  def flight_params
    params.permit(:destination, :flight_number, :nonstop, :airline_id)
  end
  
  end