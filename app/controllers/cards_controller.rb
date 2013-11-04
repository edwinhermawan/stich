class CardsController < ApplicationController

	def index
		@newcards = Card.new
		@cards = Card.all
		@pivotal_stories = Project.pull_cards(params[:project_id], current_user.token)
	end

	def show
		@card = Card.find(params[:id])
	end

	def new
		@card = Card.new
	end

	def create
		@card = Card.create(params[:card].permit(:name))
		redirect_to edit_cards_url
	end
	def edit
		@card = Card.find(params[:id])
	end

	def update
	  @card = Card.find(params[:id])

	  if @card.update_attributes(params[:card].permit(:name))
	    redirect_to @card
	  else
	  	render 'edit'
	  end
	 end

	def destroy
		@card = Card.find(params[:id]).destroy
		redirect_to cards_url
	end

end