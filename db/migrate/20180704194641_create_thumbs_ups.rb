class CreateThumbsUps < ActiveRecord::Migration[5.1]
  def change
    create_table :thumbs_ups do |t|
    	t.integer :user_id
    	t.integer :recommendation_id
      t.timestamps
    end

    add_index :thumbs_ups, :user_id
    add_index :thumbs_ups, :recommendation_id
  end
end
