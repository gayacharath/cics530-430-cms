require 'spec_helper'

describe Resource do
    before(:each) do
      @resource = Factory(:resource)
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
    
    #further validation required: research mime types
    it 'must have a valid mime type' do
      @resource.type = "bananas"
      @resource.should_not be_valid
    end
    
    #further validation required file path string: regex?
    it 'must have a valid path' do
      @resource.location = "bananas"
      @resource.should_not be_valid
    end
    
    #further validation required for date type
    it 'must have a valid creation date' do
      @resource.created_at = "01 March 2012 12.30pm"
      @resource.should_not be_valid
    end
    
    #further validation required for date types
    it 'must have a valid modified date' do
      @resource.created_at = "01 March 2012 12.31pm"
      @resource.should_not be_valid
    end
    
    #further validation required: unique name for a given directory
    it 'must have a valid (unique) file name for a given directory' do
      #a file with the same name already exists in the same directory
      @resource.name = 'file.txt'
      @resource.should_not be_valid
    end
end
