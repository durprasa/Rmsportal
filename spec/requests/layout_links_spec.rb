require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Login page at '/'" do
  	get '/'
  	response.should have_selector('title',:content=>"Login")
  end

  it "should have a Login page at '/en'" do
  	get '/en'
  	response.should have_selector('title',:content=>"Login")
  end

  it "should have a Login page at '/en'" do
  	get '/es'
  	response.should have_selector('title',:content=>"Login")
  end

  it "should have a Login page at '/en'" do
  	get '/de'
  	response.should have_selector('title',:content=>"Login")
  end

  it "should have a Home page at '/home'" do
  	get '/home'
  	response.should have_selector('title',:content=>"Home")
  end
end
