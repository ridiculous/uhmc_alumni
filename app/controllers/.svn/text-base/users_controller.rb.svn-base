class UsersController < ApplicationController

  before_filter :validate_session
  before_filter :user_authenticated!
  before_filter :has_full_access, :except => [:edit, :update, :edit_password, :update_password]
  before_filter :user_authorized, :except => [:edit, :update, :edit_password, :update_password]

  
  def new
    @user = User.new
  end

  def create
    user_info = params[:user]
    @user = User.new(user_info)

    if @user.save
      redirect_to users_path, :notice => "#{user_info[:role].capitalize} user account created"
    else
      render "new", :locals => {:selected_role => user_info[:role]}
    end
  end

  def edit
    @user = find_valid_user(params[:id])
    if @user.alumni_id
      @alumni = Alumni.find(@user.alumni_id)
    end
  end

  def index
    @users = User.where("users.id != ? AND role != 'superuser'", session[:user_id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(root_url, :notice => "#{@user.first_name}'s user account updated") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def edit_password
    @user = find_valid_user(params[:id])
  end

  def update_password
    @user = User.find(params[:user_id])

    if params[:password_confirmation] == params[:password_new]
      if params[:password_new].to_s.length > 5
        if @user.password_hash == BCrypt::Engine.hash_secret(params[:current], @user.salt)
          if @user.update_attribute(:password, params[:password_new])
            redirect_to(is_admin && session[:full_access_granted] == true ? users_path : root_url, :notice => "#{@user.first_name}'s password updated")
          else
            request.flash[:alert] = "Password update failed!"
            render "edit_password"
          end
        else
          request.flash[:alert] = "Current password is incorrect"
          render "edit_password"
        end
      else
        request.flash[:alert] = "New password must be at least 5 characters"
        render "edit_password"
      end
    else
      request.flash[:alert] = "New passwords do not match"
      render "edit_password"
    end
  end


  def show
    if params[:user_search_field]
      @users = User.get_search_results(params[:user_search_field],params[:search_options], session[:user_id])
      render "searched"
    end
  end

  private

  def find_valid_user(id)
    u = User.find(id) rescue nil
    unless u.nil?
      is_admin ? ( is_super(u.role) ) ? User.find(session[:user_id]) : u : User.find(session[:user_id])
    else
      User.find(session[:user_id])
    end
  end
  
end
