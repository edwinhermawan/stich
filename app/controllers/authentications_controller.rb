class AuthenticationsController < ApplicationController
	before_action :authenticate_user, only: [:destroy]

	def destroy
	    session[:user_id] = nil
	    redirect_to timers_url,
    	notice: "You signed out."
  	end
  	
	def new
		if current_user
			redirect_to timers_url
		else
			@user = User.new
		end
	end

	def create
    	user = User.find_by(email: params[:user][:email])
	    if user
	        # authenticate user
	        if user.authenticate(params[:user][:password])
	          session[:user_id] = user.id
	          redirect_to timers_url
	        else
	          flash.now.alert = "Unable to sign you in. Please try again."
	          render :new
	        end
	    end
	end

	
end