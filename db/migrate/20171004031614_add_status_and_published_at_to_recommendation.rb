class AddStatusAndPublishedAtToRecommendation < ActiveRecord::Migration[5.1]
  def change
  	add_column :recommendations, :status, :string
  	add_column :recommendations, :published_at, :datetime
  end
end
