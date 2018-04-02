class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.string :title
      t.date :publishing_date
      t.string :link
      t.text :description
      t.timestamps
    end
  end
end
