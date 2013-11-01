# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
  
  before(:each) do
  	@attr = {:username => "testuser",:password => "rmspassword"}
  end

  it "should create a new instance given valid attributes" do
  	User.create!(@attr) 
  end

  it "should require a username" do
  	no_name_user = User.new(@attr.merge(:username=>""))
  	no_name_user.should_not be_valid
  end

  describe "Username validations" do 

    it "should accept valid username" do
    	usernames =%w[testuser test_user test123 TEST_USER12 T12_USER]
    	usernames.each do|user|
    		valid_username = User.new(@attr.merge(:username => user))
    		valid_username.should be_valid
    	end
    end

    it "should reject invalid username" do
    	usernames =%w[test@user test,user TEST#USER12 T12USER*]
    	usernames.each do|user|
    		invalid_username = User.new(@attr.merge(:username => user))
    		invalid_username.should_not be_valid
    	end
    end

    it "should reject duplicate usernames" do
    	User.create!(@attr)
    	user_with_duplicate_username = User.new(@attr)
    	user_with_duplicate_username.should_not be_valid
    end

    it "should reject usernames identical to up case" do
    	upcased_username = @attr[:username].upcase
    	User.create!(@attr.merge(:username => upcased_username))
    	user_with_upcased_username = User.new(@attr)
    	user_with_upcased_username.should_not be_valid
    end

    it "should reject usernames that are too long" do
    	long_username = "a" * 21
    	long_username_user = User.new(@attr.merge(:username => long_username))
      long_username_user.should_not be_valid
    end
  end

  describe "password validations" do

    it "should require a password" do
      no_password_user = User.new(@attr.merge(:password=>""))
      no_password_user.should_not be_valid
    end

    it "should reject passwords that are too long" do
    	long_password = "a" * 51
    	long_password_user = User.new(@attr.merge(:password => long_password))
      long_password_user.should_not be_valid
    end

    it "should reject passwords that are short" do
    	short_password = "a" * 3
    	short_password_user = User.new(@attr.merge(:password => short_password))
      short_password_user.should_not be_valid
    end
  end

  describe "authenticate method" do
  	it "should exist" do
  		User.should respond_to(:authenticate)
  	end

  	it "should return nil on username/password mismatch" do
  		User.authenticate(@attr[:username],"mismatchpass").should be_nil
  	end

  	it "should return nil on username/password mismatch" do
  		User.authenticate("mismatchusername",@attr[:password]).should be_nil
  	end

  	it "should return user if the password and username match" do
  		User.authenticate(@attr[:username],@attr[:password]).should == @user
  	end

  end
end
