class EmploymentsController < ApplicationController

  before_filter :set_alumni
  before_filter :user_authenticated!, :validate_session
  attr_accessor :alumni_id, :employment, :alumni_name

  def index

    @employments = @alumni.employments.all
  end

  def show
    @employment = @alumni.employments.find(params[:id])
  end

  def new
    @employment = @alumni.employments.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @employment }
    end
  end

  def edit
    @employment = @alumni.employments.find(params[:id])
  end

  def create
    job_info = params[:employment]
    job_info[:end_date] = Time.now
    job_info[:work_present] = job_info[:work_present] == "work_present" ? 1 : 0
    @employment = @alumni.employments.new(job_info)

    respond_to do |format|
      if @employment.save
        format.html { redirect_to(alumni_employments_path(@alumni), :notice => 'Employment was successfully created.') }
        format.xml { render :xml => @employment, :status => :created, :location => @employment }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @employment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @employment = @alumni.employments.find(params[:id])
    job_info = params[:employment]
    job_info[:work_present] = job_info[:work_present] == "work_present" ? 1 : 0

    respond_to do |format|
      if @employment.update_attributes(job_info)
        format.html { redirect_to(alumni_employments_path(@alumni), :notice => 'Employment was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @employment.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @employment = @alumni.employments.find(params[:id])
    @employment.destroy

    respond_to do |format|
      format.html { redirect_to((is_admin ? alumni_employments_path(@alumni) : :back), :notice => "Employment Record was successfully deleted!") }
      format.xml { head :ok }
    end
  end

  protected

  def set_alumni
    begin
      @alumni = Alumni.for_user(current_user, params[:alumni_id])
    rescue
      redirect_to root_url, :notice => "There was an error finding the alumni with id: #{params[:alumni_id]} for user: #{current_user}"
    end
  end
end
