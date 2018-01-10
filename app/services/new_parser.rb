require 'rss'
require 'open-uri'
class NewParser < BaseService
  attr_reader :params

  def initialize(params, channel)
    @params = params
  end

  private

  def self.top_story_parsing
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeedstopstories.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: result.description }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.india_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/-2128936835.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }

      # description_array = result[:description].split("</a>")
      # if description_array.size > 1
      #   description_array[0] += "</a>"
      #   result[:description] = description_array[1]
      #   result[:image] = description_array[0]
      # end
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def  self.world_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/296589292.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.nri_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/1898055.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.business_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/1898055.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.cricket_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/4719161.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.sports_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/4719148.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.health_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/3908999.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.science_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/-2128672765.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.environment_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/2647163.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

end
