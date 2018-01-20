require 'rss'
require 'open-uri'
class TheHinduParser < BaseService
  attr_reader :params

  CATEGORY_URLS = {top_story: "http://www.thehindubusinessline.com/news/national/?service=rss"}

  def initialize(params, channel)
    @params = params
  end

  private

  def self.parse_all

    rss_results = {}
    CATEGORY_URLS.each do |category_url|
      rss_results[category_url[0].to_s.humanize] = []
      rss = RSS::Parser.parse(open(category_url[1]).read, false).items
      rss.each do |result|
        result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
        puts category_url[0].to_s.humanize + " => " + result.to_s
        rss_results[category_url[0].to_s.humanize].push(result)
      end
    end
    rss_results
    
  end

end
