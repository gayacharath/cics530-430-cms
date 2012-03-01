require 'spec_helper'

describe Announcement do
	context "validations" do

		before(:each) do
			@announcement = Announcement.new
			@announcement.topic= "Server Status"
			@announcement.content= "Schedule of inactivity for February"
      @announcement.type= "Warning"
    end

    it "starts out valid" do
      @announcement.should be_valid
    end

		it 'must have a topic' do
			@announcement.topic = nil
			@announcement.should_not be_valid
    end

    it 'must have well formatted topic' do
			@announcement.topic = '123456$%#'
			@announcement.should_not be_valid
    end

    it 'must have a topic with minimum four characters' do
			@announcement.topic = 'job'
			@announcement.should_not be_valid
		end

    it 'must have content' do
			@announcement.content = nil
			@announcement.should_not be_valid
    end

    it 'must have content with minimum 32 characters' do
			@announcement.content = 'some content'
			@announcement.should_not be_valid
    end

		it 'must have a type' do
			@announcement.type = nil
			@announcement.should_not be_valid
    end

  end
end
