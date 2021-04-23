class Api::TripsController < ApplicationController
  # implement Authentication/Authorization only on Trips for now
  # you gotta be logged in to see, add, update, or delete Trips
  before_action :authenticate_user

  def index
    # @trips = Trip.all
    @trips = []
    current_user.trips_owned.each { |trip_owned|
      @trips << trip_owned
    }
    current_user.trips_collaborated.each { |trip_collaborated|
      @trips << trip_collaborated
    }
    render "index.json.jb"
  end

  def show
    @trip = Trip.find_by(:id => params[:id])
    render "show.json.jb"
  end

  def create
    @trip = Trip.new(
      :title => params[:title],
      :owner_id => current_user.id,
      :collaborator_id => params[:collaborator_id],
      :description => params[:description],
      :isComplete => params[:isComplete],
      :logistics => params[:logistics],
      :ideas => params[:ideas],
    )
    if @trip.save
      render "show.json.jb"
    else
      render :json => { :errors => @trip.errors.full_messages }, :status => :bad_request
    end
  end

  def update
    @trip = Trip.find_by(:id => params[:id])

    @trip.title = params[:title] || @trip.title
    @trip.owner_id = params[:owner_id] || @trip.owner_id
    @trip.collaborator_id = params[:collaborator_id] || @trip.collaborator_id
    @trip.description = params[:description] || @trip.description
    @trip.isComplete = params[:isComplete] || @trip.isComplete
    @trip.logistics = params[:logistics] || @trip.logistics
    @trip.ideas = params[:ideas] || @trip.ideas

    if @trip.save
      render "show.json.jb"
    else
      render :json => { :errors => @trip.errors.full_messages }, :status => :bad_request
    end
  end

  def destroy
    @trip = Trip.find_by(:id => params[:id])
    # you should only be able to destroy Trips that you own
    if current_user.id == @trip.owner_id
      @trip.destroy
      render :json => { :message => "Trip was destroyed." }
    else
      render :json => { :message => "You must own this Trip to destroy it." }, :status => :unauthorized
    end
  end
end
