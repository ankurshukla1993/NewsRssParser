class NewsFeed < ActiveRecord::Base

	# Associations
	has_many :cities
	has_many :localities
	has_many :categories
	has_many :sub_categories
end
