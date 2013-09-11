require 'spec_helper'

describe "Users" do
	
	describe "sign in/out" do
		
		describe "failure" do
#			
#			it "should not sign a brother in" do
#				visit signin_path
#				fill_in :email, :with => ''
#				fill_in :password, :with => ''
#				click_button
#				response.should have_selector("div", :content => 'Invalid')
#			end
#				
#		end
#		
#		describe "success" do
#			
#			it "should sign a brother in and out" do
#				user = Factory(:user)
#				visit signin_path
#				fill_in :email, :with => user.email
#				fill_in :password, :with => user.password
#				click_button
#				controller.should be_signed_in
#				click_link "Sign out"
#				controller.should_not be_signed_in
#			end
#		
#		end
#		
	end
	
	describe "signup" do
		
		#describe 'failure' do
		#	
		#	it "should not make a new user" do
		#		lambda do
		#			visit join_path		
		#			fill_in "Name",			:with => ''
		#			fill_in "Email",					:with => ''
		#			fill_in "Password",				:with => ''
		#			fill_in "Confirmation",		:with => ''
		#			fill_in "Nation",					:with => ''
		#			click_button
		#			response.should render_template('users/new')
		#			response.should have_selector("div#error_explanation")
		#		end.should_not change(User, :count)
		#	end
		#end
		
		#describe "success" do
		#	
		#	it "should make a new user" do
		#		lambda do
		#			
		#			visit join_path
		#			fill_in "Name",					:with => "Elizabeth the Second"
		#			fill_in "Email",				:with => "queen@royal.gov"
		#			fill_in "Password",			:with => "Iamsparkly"
		#			fill_in "Confirmation",	:with => "Iamsparkly"
		#			fill_in "Nation",				 :with => "germany"
		#			click_button
		#			response.should have_selector("div",
		#																			:content => "Welcome")
		#			response.should render_template('users/show')
		#		end.should change(User, :count).by(1)
		#	end
		#	
	end
		
  end
end
