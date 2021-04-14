class Api::TripsController < ApplicationController
  def index
    @trips = Trip.all
    render "index.json.jb"
  end

  def show
    @trip = Trip.find_by(:id => params[:id])
    render "show.json.jb"
  end

  def create
    @trip = Trip.new(
      :title => params[:title],
      :owner_id => params[:owner_id],
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
    @trip.destroy
    render :json => { :message => "Trip was destroyed." }
  end
end
