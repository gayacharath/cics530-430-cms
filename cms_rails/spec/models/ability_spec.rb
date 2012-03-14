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

      it "can view their associated projects" do

      end

      it "can not view other user's associated projects" do

      end

      it "can delete owned resource" do

      end

      it "can not delete other user's resource"  do

      end

      it "can replace owned resource" do

      end

      it "can not replace other user's owned resource" do

      end

      it "can modify owned resource" do

      end

      it "can not modify other user's owned resource" do

      end

      it "can download associated project resource" do

      end

      it "can not download non-associated project resource"  do

      end


    end

end