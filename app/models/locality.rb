class Locality < ActiveRecord::Base

	# Associations
	belongs_to :city
	has_many :news_feeds
end
