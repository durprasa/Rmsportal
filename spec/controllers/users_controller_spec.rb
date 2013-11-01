require 'spec_helper'

describe UsersController do
  render_views
  describe "GET 'show'" do
   before (:each) do
      @user =Factory(:user)
    end
    
    it "should be successful" do
      get :show ,:id => @user
      response.should be_success
    end
  end

end
