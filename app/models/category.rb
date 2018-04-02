class Category < ActiveRecord::Base

	# Associations
	has_many :sub_categories
	has_many :news_feeds
end
