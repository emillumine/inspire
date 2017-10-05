class RemoveStateFromRecommendationAddPublishedToRecommendation < ActiveRecord::Migration[5.1]
  def change
  	remove_column :recommendations, :state 
  	add_column :recommendations, :published, :boolean
  end
end
