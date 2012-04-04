class AnnouncementsController < ApplicationController
  before_filter :is_logged_in

  respond_to :html, :xml, :json
  
  def index
    @resources = @project.announcements.all
  end

  def show
    @announcement = Announcement.find(params[:id])   
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(params[:announcement])
    @announcement.save
    @announcement.user = current_user
    flash[:notice] = "Successfully created announcement." if @announcement.valid?
    respond_with @announcement
  end

  def edit
    @announcement = Announcement.find(params[:id])
    respond_with @announcement
  end

  def update
    @announcement = Announcement.find(params[:id])
    @announcement.update_attributes(params[:announcement])
    flash[:notice]  = "Successfully updated announcement." if @announcement.valid?
    respond_with @announcement
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    respond_with @announcement
  end
end
