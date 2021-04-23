class Api::UsersController < ApplicationController
  def create
    user = User.new(
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :username => params[:username],
      :email => params[:email],
      :password => params[:password],
      :password_confirmation => params[:password_confirmation],
    )
    if user.save
      render :json => { :message => "User created successfully" }, :status => :created
    else
      render :json => { :errors => user.errors.full_messages }, :status => :bad_request
    end
  end

  def index
    @users = User.all
    render "index.json.jb"
  end

  def show
    @user = User.find_by(:id => params[:id])
    render "show.json.jb"
  end

  def update
    @user = User.find_by(:id => params[:id])
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.username = params[:username] || @user.username
    @user.email = params[:email] || @user.email

    if @user.save
      render "show.json.jb"
    else
      render :json => { :errors => @user.errors.full_messages }, :status => :bad_request
    end
  end

  def destroy
    @user = User.find_by(:id => params[:id])
    @user.destroy
    render :json => { :message => "User was deleted." }
  end
end
