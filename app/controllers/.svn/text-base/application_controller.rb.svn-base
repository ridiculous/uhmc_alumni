class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_controller_and_action_names
  helper_method :current_user, :user_authenticated, :is_admin, :is_super, :has_full_access

  layout :specify_layout

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def is_admin(r = nil)
    unless r
      (current_user.role === "admin" || current_user.role === "superuser") ? true : false
    else
      ( r === "admin" || r === "superuser" ) ? true : false
    end
  end

  def is_super(r = nil)
    unless r
      current_user.role.eql?("superuser") ? true : false
    else
      r.eql?("superuser") ? true : false
    end
  end

  private

  def not_found
    redirect_to root_url, :alert => "Record could not be found"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def specify_layout
    session[:user_id] ? is_admin ? "admin" : "alumni" : "sign_in"
  end

  def user_authenticated!
    redirect_to log_in_path unless session[:user_id]
  end

  def user_authorized
    redirect_to root_url unless is_admin
  end

  def has_full_access
    redirect_to root_url unless (session[:full_access_granted] == true || is_admin)
  end

  def validate_session
    if !session[:exp_time].nil? && session[:exp_time] < Time.now
      session[:user_id] = nil
      redirect_to new_session_path, :notice => "Your session has expired"
    end
    session[:exp_time] = Time.now + (30).minutes
  end

  def set_controller_and_action_names
    @current_action = action_name
    @current_controller = controller_name
  end

end
