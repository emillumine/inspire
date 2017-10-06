class ReadingRecommendationsController < RecommendationsController
  def index
  	@recommendations = ReadingRecommendation.where(published: true).order("published_at DESC")
  end

  def create
  	super do |reco|
  		reco.type = "ReadingRecommendation"
  	end
  end
end
