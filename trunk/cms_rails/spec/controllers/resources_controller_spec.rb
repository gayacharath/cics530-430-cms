require 'spec_helper'

describe ResourcesController do
  render_views

  describe "index" do

    it "index action should render index template" do
      get :index
      response.should render_template("index")
    end

  end

  describe "show" do

    it "show action should render show template" do
      get :show, :id => Resource.first
      response.should render_template(:show)
    end

  end

  describe "new" do

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end

  end

  describe "create" do

    it "create action should render new template when model is invalid" do
      Resource.any_instance.stubs(:valid?).returns(false)
      post :create
      response.should render_template(:new)
    end

    it "create action should redirect when model is valid" do
      Resource.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(resource_url(assigns[:resource]))
    end

  end

  describe "edit" do
    it "edit action should render edit template" do
      get :edit, :id => Resource.first
      response.should render_template(:edit)
    end
  end

  describe "update" do

    it "update action should render edit template when model is invalid" do
      Resource.any_instance.stubs(:valid?).returns(false)
      put :update, :id => Resource.first
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      Resource.any_instance.stubs(:valid?).returns(true)
      put :update, :id => Resource.first
      response.should redirect_to(resource_url(assigns[:resource]))
    end

  end

  describe "destroy" do

    it "destroy action should destroy model and redirect to index action" do
      resource = Resource.first
      delete :destroy, :id => resource
      response.should redirect_to(resources_url)
      Resource.exists?(resource.id).should be_false
    end

  end

end
