require File.dirname(__FILE__) + '/../spec_helper'

describe StaffsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Staff.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Staff.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Staff.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(staff_url(assigns[:staff]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Staff.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Staff.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Staff.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Staff.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Staff.first
    response.should redirect_to(staff_url(assigns[:staff]))
  end

  it "destroy action should destroy model and redirect to index action" do
    staff = Staff.first
    delete :destroy, :id => staff
    response.should redirect_to(staffs_url)
    Staff.exists?(staff.id).should be_false
  end
end
