class Api::StopsController < ApplicationController
  def index
    @stops = Stop.all
    render "index.json.jb"
  end

  def create
  end

  def update
  end

  def destroy
  end
end
