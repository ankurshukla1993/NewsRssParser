require 'rss'
require 'open-uri'
class TimesOfIndiaParser < BaseService
  attr_reader :params

  CATEGORY_URLS = {top_story: "https://timesofindia.indiatimes.com/rssfeedstopstories.cms",
                   india: "https://timesofindia.indiatimes.com/rssfeeds/-2128936835.cms",
                   world: "https://timesofindia.indiatimes.com/rssfeeds/296589292.cms",
                   nri: "https://timesofindia.indiatimes.com/rssfeeds/1898055.cms",
                   business: "https://timesofindia.indiatimes.com/rssfeeds/1898055.cms",
                   cricket: "https://timesofindia.indiatimes.com/rssfeeds/4719161.cms",
                   sports: "https://timesofindia.indiatimes.com/rssfeeds/4719148.cms",
                   health: "https://timesofindia.indiatimes.com/rssfeeds/3908999.cms",
                   science: "https://timesofindia.indiatimes.com/rssfeeds/-2128672765.cms",
                   environment: "https://timesofindia.indiatimes.com/rssfeeds/2647163.cms",
                   tech: "https://timesofindia.indiatimes.com/rssfeeds/5880659.cms",
                   education: "https://timesofindia.indiatimes.com/rssfeeds/913168846.cms",
                   sunday_toi: "https://timesofindia.indiatimes.com/rssfeeds/1945062111.cms",
                   opinion: "https://timesofindia.indiatimes.com/rssfeeds/784865811.cms",
                   entertainment: "https://timesofindia.indiatimes.com/rssfeeds/1081479906.cms",
                   life_and_style: "https://timesofindia.indiatimes.com/rssfeeds/2886704.cms"
                   }

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
