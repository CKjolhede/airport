class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
  end

  def index
    @airlines = Airline.sort_by_creation
  end
end
