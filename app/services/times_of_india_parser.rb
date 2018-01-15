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
                   sundaytoi: "https://timesofindia.indiatimes.com/rssfeeds/1945062111.cms",
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
        rss_results[category_url[0].to_s.humanize].push(result)
      end
    end
    puts rss_results
    rss_results
    
  end

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

  def self.tech_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/5880659.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.education_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/913168846.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.sundaytoi_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/1945062111.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.opinion_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/784865811.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.entertainment_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/1081479906.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  def self.lifeandstyle_top_stories
    rss_results = []
    rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeeds/2886704.cms").read, false).items

    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
      rss_results.push(result)
    end
    puts rss_results
    rss_results
  end

  # def self.mostread_top_stories
  #   rss_results = []
  #   rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeedmostread.cms").read, false).items

  #   rss.each do |result|
  #     result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
  #     rss_results.push(result)
  #   end
  #   puts rss_results
  #   rss_results
  # end

  # def self.mostshared_top_stories
  #   rss_results = []
  #   rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeedmostemailed.cms").read, false).items

  #   rss.each do |result|
  #     result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
  #     rss_results.push(result)
  #   end
  #   puts rss_results
  #   rss_results
  # end

  # def self.mostcommented_top_stories
  #   rss_results = []
  #   rss = RSS::Parser.parse(open("https://timesofindia.indiatimes.com/rssfeedmostemailed.cms").read, false).items

  #   rss.each do |result|
  #     result = { title: result.title, date: result.pubDate, link: result.link, description: ActionView::Base.full_sanitizer.sanitize(result.description) }
  #     rss_results.push(result)
  #   end
  #   puts rss_results
  #   rss_results
  # end

end
