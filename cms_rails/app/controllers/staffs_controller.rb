class StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end

  def show
    @staff = Staff.find(params[:id])
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(params[:staff])
    if @staff.save
      redirect_to @staff, :notice => "Successfully created staff."
    else
      render :action => 'new'
    end
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(params[:staff])
      redirect_to @staff, :notice  => "Successfully updated staff."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    redirect_to staffs_url, :notice => "Successfully destroyed staff."
  end
end
