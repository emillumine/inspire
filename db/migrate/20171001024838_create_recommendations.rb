class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations
    add_column :recommendations, :type, :string
    add_column :recommendations, :title, :string
    add_column :recommendations, :content, :text
  end
end
