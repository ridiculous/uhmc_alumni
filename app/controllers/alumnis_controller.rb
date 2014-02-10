class AlumnisController < ApplicationController

  before_filter :user_authenticated!

  helper_method :sort_column, :sort_direction
  before_filter :validate_session, :user_authorized, :except => [:index, :edit, :show, :update]

  def index
    if is_admin
      @alumnis = Alumni.get_search_results(params[:users_search], params[:cat]).sort_capable(params[:sort], sort_column, sort_direction).page(params[:page]).per(20)
    else
      session[:alumni_id] = session[:user_alumni_id]
      session[:alumni_name] = Alumni.setup_a_info(session[:alumni_id])
      @alumni = Alumni.find(session[:user_alumni_id])
      @jobs = @alumni.employments.all
      @schools = @alumni.schools.all
    end
  end

  def show
    @alumni = !is_admin ? Alumni.find(session[:user_alumni_id]) : Alumni.find(params[:id])
  end

  def new
    @alumni = Alumni.new
  end

  def edit
    @alumni = !is_admin ? Alumni.find(session[:user_alumni_id]) : Alumni.find(params[:id])
  end

  def create
    @alumni = Alumni.new(params[:alumni])

    if @alumni.save
      render :partial => 'alumni_row', :locals => {:a => @alumni, :msg => "#{@alumni.first_name}'s record successfully created"}, :status => :created
    else
      render :partial => 'errors', :status => :unprocessable_entity
    end
  end

  def update
    @alumni = Alumni.find(params[:id])
    if @alumni.update_attributes(params[:alumni])
      render :json => {:msg => "#{@alumni.first_name}'s record successfully updated"}
    else
      render :partial => 'errors', :status => :unprocessable_entity
    end
  end

  #Find information on Alumni's employment and education records
  def summary
    alum_id = params[:id]
    session[:alumni_id] ||= alum_id
    @alumni = Alumni.find(alum_id)
    session[:alumni_name] = (@alumni.last_name+', '+@alumni.first_name)
    @jobs = @alumni.employments.all
    @schools = @alumni.schools.all
  end

  def destroy
    @alumni = Alumni.find(params[:id])
    @alumni.destroy

    respond_to do |format|
      format.html { redirect_to(alumnis_url) }
      format.xml { head :ok }
    end
  end

  private

  def sort_column
    valid_cols = Alumni.column_names
    valid_cols << "program_name"
    valid_cols << "date_graduated"
    valid_cols.include?(params[:sort]) ? params[:sort] : "last_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
