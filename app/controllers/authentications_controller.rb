class AuthenticationsController < ApplicationController
	before_action :authenticate_user, only: [:destroy]

	def destroy
	    session[:user_id] = nil
	    redirect_to '/authentications/new',
    	notice: "You signed out."
  	end
  	
	def new
		if current_user
			redirect_to cards_url
		else
			@user = User.new
			@newuser = User.new
		end
	end

	def create
    	user = User.find_by(email: params[:user][:email])
	    if user
	        # authenticate user
	        if user.authenticate(params[:user][:password])
	          session[:user_id] = user.id
	          redirect_to cards_url
	        else
	          flash.now.alert = "Unable to sign you in. Please try again."
	          render :new
	        end
	    end
	end

	
end