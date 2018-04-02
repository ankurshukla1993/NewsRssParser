class Country < ActiveRecord::Base
	has_many :news_feeds
end
