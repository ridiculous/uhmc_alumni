class SessionsController < ApplicationController
  before_filter :validate_session
  before_filter :user_authenticated!, :except => [:new, :create, :destroy]
  require 'time'

  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      reset_session #avoid fixation attack
      session[:user_id] = user.id
      session[:user_role] = user.role
      session[:username] = user.username
      session[:user_alumni_id] = user.alumni_id
      session[:user_alumni_name] = user.last_name+', '+user.first_name
      session[:full_access_granted] = false
      user.update_attribute(:last_logged, Time.now)
      redirect_to root_url
    else
      request.flash[:alert] = "Invalid username/password"
      render "new"
    end
  end

  def show
    redirect_to users_path if session[:full_access_granted] == true
  end

  def confirmation
    #Authenticate user w/ session USERNAME and PASSWORD passed in as params
    u = User.authenticate(session[:username], params[:password])
    if u
      session[:full_access_granted] = true
      redirect_to users_path
    else
      request.flash[:alert] = "Incorrect password"
      render "show"
    end

  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to log_in_path, :notice => "Signed out"
  end

end
