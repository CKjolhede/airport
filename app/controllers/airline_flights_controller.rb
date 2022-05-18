class AirlineFlightsController < ApplicationController

  def index
    @airline = Airline.find(params[:id])
    @flights = @airline.flights.alphabetized
  end

  def new 
  end


  def create
    @airline = Airline.find(params[:airline_id])
    @airline.flights.create(flight_params)
    redirect_to "/airlines/#{@airline.id}/flights"
  end



  private

  def flight_params
    params.permit(:destination, :flight_number, :nonstop, :airline_id)
  end
  
  end