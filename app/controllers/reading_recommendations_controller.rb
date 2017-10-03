class ReadingRecommendationsController < RecommendationsController
  def index
  	@reading_recommendations = ReadingRecommendation.all
  end

  def new
  	super
  end

  def create
  	super do |recommendation|
  		recommendation.type = "ReadingRecommendation"
  	end
  end
end
