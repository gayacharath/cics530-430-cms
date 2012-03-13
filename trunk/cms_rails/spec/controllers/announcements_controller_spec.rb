require 'spec_helper'

describe AnnouncementsController do
  render_views

  describe "index" do
    it "should render index template" do
      get "index"
      response.should render_template(:index)
    end
  end

  describe "show" do
    it "should render show template" do
      get :show, :id => Announcement.first
      response.should render_template(:show)
    end
  end

  describe "new" do
    it "should render new template" do
      get :new
      response.should render_template(:new)
    end
  end

  describe "create" do
    it "should render new template when model is invalid" do
      Announcement.any_instance.stubs(:valid?).returns(false)
      post :create
      response.should render_template(:new)
    end

    it "should redirect when model is valid" do
      Announcement.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(announcement_url(assigns[:announcement]))
    end

  end

  describe "edit" do
    it "should render edit template" do
      get :edit, :id => Announcement.first
      response.should render_template(:edit)
    end
  end

  describe "update" do
    it "should render edit template when model is invalid" do
      Announcement.any_instance.stubs(:valid?).returns(false)
      put :update, :id => Announcement.first
      response.should render_template(:edit)
    end

    it "should redirect when model is valid" do
      Announcement.any_instance.stubs(:valid?).returns(true)
      put :update, :id => Announcement.first
      response.should redirect_to(announcement_url(assigns[:announcement]))
    end
  end

  describe "destroy" do
    it "model and redirect to index action" do
      announcement = Factory(:announcement)
      delete :destroy, :id => announcement.id
      response.should redirect_to(announcements_url)
      Announcement.exists?(announcement.id).should be_false
    end
  end
  
end
