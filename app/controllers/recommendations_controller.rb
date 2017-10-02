class RecommendationsController < ApplicationController
  def home
  end

  def index
  	@recommendations = Recommendation.all
  end
end
