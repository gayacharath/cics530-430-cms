require 'spec_helper'

describe User do

	context "validations" do

		before(:each) do
			@user = User.new 
			@user.full_name = "Matthew Robertson"
			@user.pref_name = "Matt"
			@user.email = "matt@email.com"
		end

		it 'it starts out valid' do
			@user.should be_valid
		end

		it 'must have a email' do
			@user.email = nil
			@user.should_not be_valid
		end

		it 'must have a full name'

		it 'must have well formatted name'

		it 'must have name that is at least 3 characters'

		it 'must have a well formatted email'



	end
  
end
