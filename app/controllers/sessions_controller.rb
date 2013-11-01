class SessionsController < ApplicationController
  def login
    @title = "Login"
  end

  def create
  	user = User.authenticate(params[:session][:username],params[:session][:password])
  	if user.nil?
      flash[:status]= FALSE
  		flash[:alert] = t("invalid_login_text")
  		@title = "Login"
  		redirect_to root_path
  	else
  		redirect_to user
  	end  	
  end

  def destroy
  	redirect_to root_path
  end
end
