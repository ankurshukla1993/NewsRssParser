class AddTagToNewsFeed < ActiveRecord::Migration
  def change
  	add_column :news_feeds, :tag, :string
  	add_index :news_feeds, :publishing_date
  end
end
