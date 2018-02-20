class City < ActiveRecord::Base

	# Associations
	has_many :localities
	has_many :news_feeds
end
