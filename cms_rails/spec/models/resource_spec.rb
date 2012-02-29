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

end
