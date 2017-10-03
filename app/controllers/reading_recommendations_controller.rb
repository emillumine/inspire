class ReadingRecommendationsController < RecommendationsController
  def index
  	@reading_recommendations = ReadingRecommendation.all
  end

  def new
  	super
  end

  def create
  	super do |reco|
  		reco.type = "ReadingRecommendation"
  	end
  end
end
