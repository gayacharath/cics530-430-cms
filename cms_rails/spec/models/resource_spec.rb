require 'spec_helper'

describe Resource do
    before(:each) do
      @resource = Factory.build(:resource)
    end

    it 'starts out valid on creation' do
			@resource.should be_valid
      @resource.save
      @resource.errors.each do |x|
           x.each do |y|
             puts y

        end
      end
    end
    
    it 'must have an owner' do
      @resource.user_id = nil
      @resource.should_not be_valid
    end

    it 'must have a project_id' do
      @resource.project_id = nil
      @resource.should_not be_valid
    end

    it 'must have a name' do
      @resource.name = nil
      @resource.should_not be_valid
    end

    it 'must have an alphanumeric name with no spaces' do
      @resource.name = "some resource"
      @resource.should_not be_valid
    end

    it 'must have a name with at least one letter or number' do
      @resource.name = "-"
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

    it 'description must be at least 4 characters, and no larger than 256' do
      @resource.description = "abc"
      @resource.should_not be_valid
    end

    it 'must have a location' do
      @resource.location = nil
      @resource.should_not be_valid
    end

    it 'must have a mime type' do
      @resource.mime = nil
      @resource.should_not be_valid
    end

    it 'must have a creation date' do
      @resource.created_at = nil
      @resource.should_not be_valid
    end

    it 'must have a modified date' do
      @resource.updated_at = nil
      @resource.should_not be_valid
    end

    #further validation required: research mime types
    #removed: resource can be any tangible file, hence any mime type (even empty file)

    #further validation required file path string: regex?
    #path will be retrieved by system after resource uploaded to project directory
    it 'must have a path' do
      @resource.location = nil
      @resource.should_not be_valid
    end

    #further validation required for date type
    #further validation required for date types
    #removed: system will handle dates

    #further validation required: unique name for a given directory
    it 'name must be unique to a project' do
      #a file with the same name already exists in the same directory
      @resource.save.should be_true
      resource2 = Resource.new(:name =>  @resource.name, :project_id => @resource.project_id)
      resource2.should_not be_valid
    end
end
