require 'spec_helper'

describe 'the log in process' do
  
  before(:each) do
    # this is set up code and it will run
    # one time before each of the specs below
    @the_truth  = true
    @nil_var    = "not nil"
  end
  
  it 'has a link to the sign up page' do
    visit login_url
    page.should have_content "sign up"
  end 
  
  it 'redirects a user to thier dashboard after login'
  
  it 'informs the user if thier log in credentials are incorrect'
  
  it 'allows us to edit a file online'
  
  it 'is going to create a confilct s'
  
end
