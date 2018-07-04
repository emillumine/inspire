class ThumbsUp < ApplicationRecord
	belongs_to :recommendation
	belongs_to :user
end
