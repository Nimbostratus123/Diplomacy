require 'spec_helper'
include UnitsHelper

describe "Unit Testing" do

	before(:each) do
		@unit1 = Factory(:unit)
		@unit2 = Factory(:unit)
		@unit2.destination = "howdy"
		@unit2.location = 'marseilles'
		@unit2.save!
	end
	
	it 'should be a unit' do
		@unit2.destination.should match @unit1.destination
	end
	
	it 'should move' do
		@unit2.destination = 'gascony'
		@unit2.save
		movement()
		@unit2.location.should match @unit2.destination
	end
	
	it 'should not move' do
		movement()
		@unit2.location.should_not match @unit2.destination
	end
	
end