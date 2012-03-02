require 'spec_helper'

describe Ability do

    context "is_admin" do


    end


    context "not_admin" do
      before(:each) do
        @user = Factory(:user)
        @ability = Ability.new(@user)
      end

      it "can edit themselves" do
        @ability.should be_able_to(:edit, @user)
      end

      it "can not edit another user" do
        @ability.should_not be_able_to(:edit, @user)
      end
    end

end