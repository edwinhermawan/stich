class TimersController < ApplicationController

	def index
		@timers = Timer.all
	end

	def show
		@timer = Timer.find(params[:id])
	end

	def new
		@timer = Timer.new
	end

	def create
		@timer = Timer.create(params[:timer].permit(:name))
		redirect_to :action => "show", :id =>@timer._id
	end

	def destroy
		@timer = Timer.find(params[:id]).destroy
		redirect_to timers_url
	end

end