module RecommendationsHelper
	def draft_accessible?(recommendation)
		!recommendation.published? && recommendation.user == current_user
	end
end
