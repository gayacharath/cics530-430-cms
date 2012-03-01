require 'spec_helper'

describe Resource do
    before(:each) do
      @resource = Resource.new
      @resource.user_id=1
      @resource.project_id=1
      @resource.name="file.txt"
      @resource.version=1
      @resource.description="Test file for project"
      @resource.location="/path_to_location"
      @resource.type="text"
      @resource.created_at="2012-02-15"
      @resource.updated_at="2012-02-16"
    end

    it 'starts out valid on creation' do
      @resource.should be_valid
    end
    
    it 'must have a user id' do
      @resource.user_id = nil
      @resource.should_not be_valid
    end
    
    it 'must have a name' do
      @resource.name = nil
      @resource.should_not be_valid
    end
    
    it 'must have a version number' do
      @resource.version = nil
      @resource.should_not be_valid
    end
    
    it 'must have a description' do
      @resource.description = nil
      @resource.should_not be_valid
    end
    
    it 'must have a location' do
      @resource.location = nil
      @resource.should_not be_valid
    end
    
    it 'must have a mime type' do
      @resource.type = nil
      @resource.should_not be_valid
    end
    
    it 'must have a creation date' do
      @resource.created_at = nil
      @resource.should_not be_valid
    end
    
    it 'must have a modified date' do
      @resource.modified_at = nil
      @resource.should_not be_valid
    end
    
    #further validation required
    it 'must have a valid mime type' do
      @resource.type = "bananas"
      @resource.should_not be valid
    end
    
    #further validation required
    it 'must have a valid path' do
      @resource.location = "bananas"
      @resource.should_not be valid
    end
end
