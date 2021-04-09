class Api::TripsController < ApplicationController
  def index
    @trips = Trip.all
    render "index.json.jb"
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
