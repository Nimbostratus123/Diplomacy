require 'spec_helper'

describe Move do
  
	before(:each) do
		@user = Factory(:user)
		@move = @user.moves.build(:destination => "galicia", :origin => "budapest")
	end
	
	describe "initialized" do
		
		it "should have attributes" do
			@move.should respond_to(:origin)
			@move.should respond_to(:destination)
		end
		
		it "should be valid" do
			@move.should be_valid
		end
		
		it "should be invalid" do
			Move.create(:destination => "galicia").should_not be_valid
		end
		
	end
	
end
