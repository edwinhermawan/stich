class CardsController < ApplicationController

	def index
		@cards = Card.all
	end

	def show
		@card = Card.find(params[:id])
	end

	def new
		@card = Card.new
	end

	def create
		@card = Card.create(params[:card].permit(:name))
		redirect_to cards_url
	end

	def destroy
		@card = Card.find(params[:id]).destroy
		redirect_to cards_url
	end

end