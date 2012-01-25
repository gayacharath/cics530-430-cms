require 'spec_helper'

describe 'the log in process' do
  
  before(:each) do
    # this is set up code and it will run
    # one time before each of the specs below
    @the_truth  = true
    @nil_var    = nil
  end
  
  it 'passes a test that will always pass' do
    @the_truth.should be true
  end
  
  it 'fails a test that should always fail' do
    @nil_var.should_not be_nil
  end
  
  it 'has a link to the sign up page'
  
  it 'redirects a user to thier dashboard after login'
  
  it 'informs the user if thier log in credentials are incorrect'
  
end
