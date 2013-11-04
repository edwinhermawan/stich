class Project
	include Mongoid::Document
	has_and_belongs_to_many :pusers, class_name: 'User', 
	inverse_of: :uprojects

	field :project_id, type: String

	has_many :cards

	def self.pull_cards(project_id, token)
        search_url = "https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories?filter=state:delivered,finished,rejected,started,unstarted,unscheduled&limit=20"
        response = HTTParty.get search_url, 
        {:headers => {'X-TrackerToken' => token }}
        if response.to_hash.has_key?("kind") && response["kind"] == "error"
			ids = []
       	else 
		    ids = response.map { |x| x['name'] }
        end
    end
    end	
