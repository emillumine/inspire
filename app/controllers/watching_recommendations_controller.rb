class WatchingRecommendationsController < RecommendationsController
  def index
  	@recommendations = WatchingRecommendation.where(published: true).order("published_at DESC")
  end
end
