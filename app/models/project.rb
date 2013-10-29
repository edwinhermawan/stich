class Project
	include Mongoid::Document
	has_and_belongs_to_many :pusers, class_name: 'User', 
	inverse_of: :uprojects
	has_many :cards
end