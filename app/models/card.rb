class Card
	include Mongoid::Document
	field :name, type: String
	field :timer, type: String
	
	belongs_to :project

end