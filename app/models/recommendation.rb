class Recommendation < ApplicationRecord
	belongs_to :user
	has_many :thumbs_ups

	validates :title, presence: {
		message: "Erreur ! Le titre doit être renseigné."
	}

	validates :content, presence: {
		message: "Erreur ! Le contenu doit être renseigné."
	}
end
