class UsersController < ApplicationController
	
	def new
		@newuser = User.new
	end

	def create
		@newuser = User.create(params[:user].permit(:email, :password, :password_confirmation))
		redirect_to timers_url
	end
end