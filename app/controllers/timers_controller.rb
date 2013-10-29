class TimersController < ApplicationController

	def index
		@timers = Timer.all
		@token = User.
	end

	def show
		@timer = Timer.find(params[:id])
	end

	def new
		@timer = Timer.new
	end

	def create
		@timer = Timer.create(params[:timer].permit(:name))
		redirect_to timers_url
	end

	def destroy
		@timer = Timer.find(params[:id]).destroy
		redirect_to timers_url
	end

end