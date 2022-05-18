class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
  end

  def new
  end

  def index
    @airlines = Airline.sort_by_creation
  end

  def create
    Airline.create(airline_params)
    redirect_to '/airlines'
  end

  def destroy
    Airline.destroy(params[:id])
    redirect_to '/airlines'
  end

  def edit
    @airline_id = params[:id]
    @airline = Airline.find(params[:id])
  end

  def update
    airline = Airline.find(params[:id])
    airline.update(airline_params)
    airline.save

    redirect_to "/airlines/#{airline.id}"
  end

private

    def airline_params
      params.permit(:name, :on_time, :rating)
    end

end
