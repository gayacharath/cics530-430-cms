class AnnoucementsController < ApplicationController
  def index
    @annoucements = Annoucement.all
  end

  def show
    @annoucement = Annoucement.find(params[:id])
  end

  def new
    @annoucement = Annoucement.new
  end

  def create
    @annoucement = Annoucement.new(params[:annoucement])
    if @annoucement.save
      redirect_to @annoucement, :notice => "Successfully created annoucement."
    else
      render :action => 'new'
    end
  end

  def edit
    @annoucement = Annoucement.find(params[:id])
  end

  def update
    @annoucement = Annoucement.find(params[:id])
    if @annoucement.update_attributes(params[:annoucement])
      redirect_to @annoucement, :notice  => "Successfully updated annoucement."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @annoucement = Annoucement.find(params[:id])
    @annoucement.destroy
    redirect_to annoucements_url, :notice => "Successfully destroyed annoucement."
  end
end
