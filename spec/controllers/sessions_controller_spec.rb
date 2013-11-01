require 'spec_helper'

describe SessionsController do

  render_views

  before(:each) do
    @base_title = "Retail Management System"
  end

  describe "GET 'login'" do
    it "should be successful" do
      get 'login'
      response.should be_success
    end

    it "should have right title" do
      get "login"
      response.should have_selector("title",:content => "#{@base_title} | Login")
    end 

    it "should have a non-blank body" do
      get 'login'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  	describe "failure" do
		before(:each) do
			@attr = {:username =>"", :password=>""}
		end
		it "should re-render the Login page" do
			post :create, :session =>@attr
			response.should redirect_to(root_path)
		end

		it "should have an error message" do
			post :create,:session => @attr
			flash[:alert].should =~ /invalid/i				
		end
	end

	describe "success" do

		before(:each) do
			@user = Factory(:user)
			@attr = {:username => @user.username, :password => @user.password}
		end

		it "should redirect to the user show page" do
			post :create,:session => @attr
			response.should redirect_to(user_path(@user))
		end
	end
end
