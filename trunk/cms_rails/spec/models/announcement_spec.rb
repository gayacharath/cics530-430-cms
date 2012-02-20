require 'spec_helper'

describe Announcement do
	context "validations" do

		before(:each) do
			@announcements = Announcement.new
			@announcements.topic= "Server Status"
			@announcements.content= "Schedule of inactivity for February"
      @announcements.type= "Warning"
    end

    it "starts out valid" do
      @announcements.should be_valid
    end

		it 'must have a topic' do
			@announcements.topic = nil
			@announcements.should_not be_valid
    end

    it 'must have well formatted topic' do
			@announcements.topic = '123456$%#'
			@announcements.should_not be_valid
    end

    it 'must have a topic with minimum four characters' do
			@announcements.topic = 'job'
			@announcements.should_not be_valid
		end

    it 'must have content' do
			@announcements.content = nil
			@announcements.should_not be_valid
    end

    it 'must have content with minimum 32 characters' do
			@announcements.content = 'some content'
			@announcements.should_not be_valid
    end

		it 'must have a type' do
			@announcements.type = nil
			@announcements.should_not be_valid
    end

  end
end
