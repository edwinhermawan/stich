class GoogleauthController < ApplicationController
	def index
	  @authentications = current_user.googleauth if current_user
	end

	def create
	  auth = request.env["omniauth.auth"]
	  # user = User.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
	  # session[:user_id] = user.id
	  flash[:notice] = "Authentication successful."
	  redirect_to cards_url
	end

	def destroy
	  @authentication = current_user.authentications.find(params[:id])
	  @authentication.destroy
	  flash[:notice] = "Successfully destroyed authentication."
	  redirect_to authentications_url
	end
end