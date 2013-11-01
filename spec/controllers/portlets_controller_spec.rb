require 'spec_helper'

describe PortletsController do

  render_views

  before(:each) do
    @base_title = "Retail Management System"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have right title" do
      get "home" 
      response.should have_selector("title",:content => "#{@base_title} | Home")
    end

     it "should have a non-blank body" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end
end
