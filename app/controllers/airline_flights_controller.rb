class AirlineFlightsController < ApplicationController

  def index
    @airline = Airline.find(params[:airline_id])
    @flights = @airline.flights
  end
end