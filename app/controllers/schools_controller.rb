class SchoolsController < ApplicationController

  before_filter :set_alumni
  before_filter :user_authenticated!, :validate_session
  attr_accessor :alumni_id, :school, :alumni_name

  def index
    @schools = @alumni.schools.all
  end

  def show
    @school = @alumni.schools.find(params[:id])
  end

  def new
    @school = @alumni.schools.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @school }
    end
  end

  def edit
    @school = @alumni.schools.find(params[:id])
  end

  def create
    @school = @alumni.schools.new(params[:school])

    respond_to do |format|
      if @school.save
        format.html { redirect_to(alumni_schools_path(@alumni), :notice => 'School was successfully created.') }
        format.xml { render :xml => @school, :status => :created, :location => @school }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @school = @alumni.schools.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        format.html { redirect_to(alumni_schools_path(@alumni), :notice => 'School was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @school = @alumni.schools.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to((is_admin ? alumni_schools_path(@alumni) : :back), :notice => "Education Record successfully deleted!") }
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
