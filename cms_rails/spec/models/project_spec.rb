require 'spec_helper'

describe Project do
  
  context "validations" do

    before(:each) do
      @project = Project.new 
      @project.started_at = "2012-02-15"
      @project.ending_at = "2012-03-15"
      @project.name = "CICS-530"
      @project.description = "Term project for MSS students based on content management system"
      @project.owner_id = 1
    end

    it 'starts out valid project creation' do
      @project.should be_valid
    end

    it 'must have a started date' do
      @project.started_at = nil
      @project.should_not be_valid
    end

    it 'must have a ending date' do
      @project.ending_at = nil
      @project.should_not be_valid
    end
    
    it 'must have a name' do
      @project.name = nil
      @project.should_not be_valid
    end

    it 'must have a description' do
      @project.description = nil
      @project.should_not be_valid
    end
  
    it 'must have a owner' do
      @project.owner_id = nil
      @project.should_not be_valid
    end
    
    it 'must have well formatted name' do
      @project.name = '123456$%#'
      @project.should_not be_valid
    end

    it 'must have name that is at least 3 characters' do
      @project.name = 'ba'
      @project.should_not be_valid
    end

    it 'must have a unique name' do
      @project.save.should be_true
      project2 = Project.new(:name => "CICS-530", :started_at => @project.started_at, :ending_at => @project.ending_at,
      :description => @project.description, :owner_id => @project.owner_id)
      project2.should_not be_valid
    end
  end
   
end


