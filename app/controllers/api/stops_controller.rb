class Api::StopsController < ApplicationController
  def index
    @stops = Stop.all
    render "index.json.jb"
  end

  def show
    @stop = Stop.find_by(:id => params[:id])
    render "show.json.jb"
  end

  def create
    @stop = Stop.new(
      :trip_id => params[:trip_id],
      :destination_id => params[:destination_id],
      :start_date => params[:start_date],
      :end_date => params[:end_date],
    )
    if @stop.save
      render "show.json.jb"
    else
      render :json => { :errors => @stop.errors.full_messages }, :status => :bad_request
    end
  end

  def update
    @stop = Stop.find_by(:id => params[:id])
    @stop.trip_id = params[:trip_id] || @stop.trip_id
    @stop.destination_id = params[:destination_id] || @stop.destination_id
    @stop.start_date = params[:start_date] || @stop.start_date
    @stop.end_date = params[:end_date] || @stop.end_date

    if @stop.save
      render "show.json.jb"
    else
      render :json => { :errors => @stop.errors.full_messages }, :status => :bad_request
    end
  end

  def destroy
    @stop = Stop.find_by(:id => params[:id])
    @stop.destroy
    render :json => { :message => "Stop was destroyed." }
  end
end
