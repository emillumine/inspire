class FixColumnNameStatus < ActiveRecord::Migration[5.1]
  def change
  	rename_column :recommendations, :status, :state
  end
end
