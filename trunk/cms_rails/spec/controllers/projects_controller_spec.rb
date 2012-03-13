require 'spec_helper'

describe ProjectsController do
  render_views

  describe "index" do
    it "should render index template" do
      get :index
      response.should render_template(:index)
    end
  end

  describe "show" do
    it "should render show template" do
      get :show, :id => Project.first
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
      Project.any_instance.stubs(:valid?).returns(false)
      post :create
      response.should render_template(:new)
    end

    it "should redirect when model is valid" do
      Project.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(project_url(assigns[:project]))
    end
  end

  describe "edit" do
    it "should render edit template" do
      get :edit, :id => Project.first
      response.should render_template(:edit)
    end
  end

  describe "update" do
    it "should render edit template when model is invalid" do
      Project.any_instance.stubs(:valid?).returns(false)
      put :update, :id => Project.first
      response.should render_template(:edit)
    end

    it "should redirect when model is valid" do
      Project.any_instance.stubs(:valid?).returns(true)
      put :update, :id => Project.first
      response.should redirect_to(project_url(assigns[:project]))
    end
  end

  describe "destroy" do
    it "should destroy model and redirect to index action" do
      project = Project.first
      delete :destroy, :id => project
      response.should redirect_to(projects_url)
      Project.exists?(project.id).should be_false
    end
  end

end
