class FlightsController < ApplicationController

  def show
    @flight = Flight.find(params[:id])
  end
  
  def index
    @flights = Flight.all
  end

  def nonstop_flights
    @flights = Flight.nonstops
  end

  def edit
    @flight_id = params[:id]
    @flight = Flight.find(params[:id])
  end

   def update
    flight = Flight.find(params[:id])
    flight.update(flight_params)
    flight.save

    redirect_to "/flights/#{flight.id}"
  end

    def destroy
    Flight.destroy(params[:id])
    redirect_to '/flights'
  end

  private

    def flight_params
      params.permit(:destination, :nonstop, :flight_number)
    end
end