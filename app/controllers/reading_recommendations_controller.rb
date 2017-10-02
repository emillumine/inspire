class ReadingRecommendationsController < ApplicationController
  def index
  	@reading_recommendations = ReadingRecommendation.all
  end
end
