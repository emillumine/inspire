class AddUserIdToRecommendations < ActiveRecord::Migration[5.1]
  def change
  	add_column :recommendations, :user_id, :integer
  	add_index :recommendations, :user_id
  end
end
