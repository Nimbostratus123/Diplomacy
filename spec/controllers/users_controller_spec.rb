require 'spec_helper'

describe UsersController do
	render_views 
	
	describe "Put 'update'" do
		
#		before(:each) do
#			@user = Factory(:user)
#			test_sign_in(@user)
#		end
#		
#		describe "failure" do
#			
#			before(:each) do
#				@attr = {
#					:email => '',
#					:name => '',
#					:password => '',
#					:password_confirmation => '',
#					:nation => ''
#				}
#			end
#			
#			it "should render the 'edit' page" do
#				put :update, :id => @user, :user => @attr
#				response.should render_template('edit')
#			end
#			
#			it "have the right title" do
#				put :update, :id => @user, :user => @attr
#				response.should have_selector("title", :content => "Edit User")
#			end
#			
#		end
#		
#		describe 'success' do
#			
#			before(:each) do
#				@attr = {
#					:name => "New Name",
#					:email => "user@example.com",
#					:password => "barbaz",
#					:password_confirmation => "barbaz",
#					:nation => "england"
#				}
#			end
#			
#			it "should change the user's attributes" do
#				put :update, :id => @user, :user => @attr
#				@user.reload
#				@user.name.should == @attr[:name]
#				@user.email.should == @attr[:email]
#			end
#			
#		end
#			
	end
	
#	describe "GET 'show'" do
#		
#		before(:each) do
#			@user = Factory(:user)
#		end
#		
#		it 'should be successful' do
#			get :show, :id => @user
#			response.should be_success
#		end
#		
#		it "should find the right user" do
#			get :show, :id => @user
#			assigns(:user).should == @user
#		end
#		
#	end
#	
	
	
  describe "GET 'new'" do
		
    #it 'should be successful' do
    #  get :new
    #  response.should be_success
    #end
	#	
	#	it 'should have the right title' do
	#		get :new
	#		response.should have_selector("title", :content => "Join")
	#	end
	#end
	#
	#describe "POST 'create'" do
	#	
	#	
	#	describe "failure" do
	#		
	#		before(:each) do
	#			@attr = { :name => "",
	#					 			:email => "", 
	#								:password => "", 
	#								:password_confirmation => "",
	#								:nation => ""
	#							}
	#		end
	#		
	#		it "should not create a user" do
	#			lambda do
	#				post :create, :user => @attr
	#			end.should_not change(User, :count)
	#		end
	#		
	#		it "should have the right title" do
	#			post :create, :user => @attr
	#			response.should have_selector("title", :content => 'Join')
	#		end
	#		
	#		it "should render the 'new' page" do
	#			post :create, :user => @attr
	#			response.should render_template('new')
	#		end
	#		
	#	end
	#	
	#	
	#	describe 'success' do
	#		
	#		before(:each) do
	#			@attr = { :name => "New User", :email => "user@example.com",
	#					 			:password => 'foobar', :password_confirmation => 'foobar', 
	#								:nation => 'england' }
	#		end
	#		
	#		it "should create a user" do
	#			lambda do
	#				post :create, :user => @attr
	#			end.should change{User.count}.by(1)
	#		end
	#		
	#		it "sould redirect to the user show page" do
	#			post :create, :user => @attr
	#			response.should redirect_to(user_path(assigns(:user)))
	#		end
	#		
	#		it "should sign the user in" do
	#			post :create, :user => @attr
	#			controller.should be_signed_in
	#		end
	#		
	#	end
	#
	#	describe "authentication of edit/update pages" do
	#	
	#		before(:each) do
	#			@user = Factory(:user) 
	#		end
	#		
	#		describe 'for signed-in users' do
	#			
	#			before(:each) do
	#				wrong_user = Factory(:user, :email => "user@example.net", :nation => "turkey")
	#				test_sign_in(wrong_user)
	#			end
	#			
	#			it "should require matching users for 'edit'" do
	#				get :edit, :id => @user
	#				response.should redirect_to(root_path)
	#			end
	#			
	#			it "should require matching users for 'update'" do
	#				put :update, :id => @user, :user => {}
	#				response.should redirect_to(root_path)
	#			end
	#			
	#			
	#		end
	#		
	#		describe "for non-signed-in users" do
	#			
	#			it "should deny access to 'edit'" do
	#				get :edit, :id => @user
	#				response.should redirect_to(signin_path)
	#			end
	#			
	#			it "should deny access to 'update'" do
	#				put :update, :id => @user, :user => {}
	#				response.should redirect_to(signin_path)
	#			end
	#		
	#		end
	#			
	#	end
		
	end
	
end
