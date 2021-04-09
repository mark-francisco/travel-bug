class Api::DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    render "index.json.jb"
  end
end
