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

  CITY_URLS = {mumbai: "https://timesofindia.indiatimes.com/rssfeeds/-2128838597.cms",
               delhi: "https://timesofindia.indiatimes.com/rssfeeds/-2128839596.cms",
               bangalore:"https://timesofindia.indiatimes.com/rssfeeds/-2128833038.cms",
               hyderabad: "https://timesofindia.indiatimes.com/rssfeeds/-2128816011.cms",
               chennai: "https://timesofindia.indiatimes.com/rssfeeds/2950623.cms",
               ahmedabad: "https://timesofindia.indiatimes.com/rssfeeds/-2128821153.cms",
               allahabad: "https://timesofindia.indiatimes.com/rssfeeds/3947060.cms",
               bhubaneswar: "https://timesofindia.indiatimes.com/rssfeeds/4118235.cms",
               coimbatore: "https://timesofindia.indiatimes.com/rssfeeds/7503091.cms",
               gurgaon: "https://timesofindia.indiatimes.com/rssfeeds/6547154.cms",
               guwahati: "https://timesofindia.indiatimes.com/rssfeeds/4118215.cms",
               hubballi: "https://timesofindia.indiatimes.com/rssfeeds/3942695.cms",
               kanpur: "https://timesofindia.indiatimes.com/rssfeeds/3947067.cms",
               kolkata: "https://timesofindia.indiatimes.com/rssfeeds/-2128830821.cms",
               ludhiana: "https://timesofindia.indiatimes.com/rssfeeds/3947051.cms",
               mangaluru: "https://timesofindia.indiatimes.com/rssfeeds/3942690.cms",
               mysuru: "https://timesofindia.indiatimes.com/rssfeeds/3942693.cms",
               noida: "https://timesofindia.indiatimes.com/rssfeeds/8021716.cms",
               pune: "https://timesofindia.indiatimes.com/rssfeeds/-2128821991.cms",
               goa: "https://timesofindia.indiatimes.com/rssfeeds/3012535.cms",
               chandigarh: "https://timesofindia.indiatimes.com/rssfeeds/-2128816762.cms",
               lucknow: "https://timesofindia.indiatimes.com/rssfeeds/-2128819658.cms",
               patna: "https://timesofindia.indiatimes.com/rssfeeds/-2128817995.cms",
               jaipur: "https://timesofindia.indiatimes.com/rssfeeds/3012544.cms",
               nagpur: "https://timesofindia.indiatimes.com/rssfeeds/442002.cms",
               rajkot: "https://timesofindia.indiatimes.com/rssfeeds/3942663.cms",
               ranchi: "https://timesofindia.indiatimes.com/rssfeeds/4118245.cms",
               surat: "https://timesofindia.indiatimes.com/rssfeeds/3942660.cms",
               vadodara: "https://timesofindia.indiatimes.com/rssfeeds/3942666.cms",
               varanasi: "https://timesofindia.indiatimes.com/rssfeeds/3947071.cms",
               thane: "https://timesofindia.indiatimes.com/rssfeeds/3831863.cms",
               thiruvananthapuram: "https://timesofindia.indiatimes.com/rssfeeds/878156304.cms"
               }

  WORLD_URLS = {usa: "https://timesofindia.indiatimes.com/rssfeeds/30359486.cms",
                pakistan: "https://timesofindia.indiatimes.com/rssfeeds/30359534.cms",
                south_asia: "https://timesofindia.indiatimes.com/rssfeeds/3907412.cms",
                united_kingdom: "https://timesofindia.indiatimes.com/rssfeeds/2177298.cms",
                europe: "https://timesofindia.indiatimes.com/rssfeeds/1898274.cms",
                china: "https://timesofindia.indiatimes.com/rssfeeds/1898184.cms",
                middle_east: "https://timesofindia.indiatimes.com/rssfeeds/1898272.cms",
                rest_of_the_world: "https://timesofindia.indiatimes.com/rssfeeds/671314.cms",
                mad_mad_world: "https://timesofindia.indiatimes.com/rssfeeds/671314.cms"
                }

  def initialize(params, channel)
    @params = params
  end

  private

  def self.parse_all

    rss_results = {}
    all_urls = CATEGORY_URLS.merge(CITY_URLS).merge(WORLD_URLS)
    all_urls.each do |category_url|
      rss_results[category_url[0].to_s.humanize] = []
      rss = RSS::Parser.parse(open(category_url[1]).read, false).items
      rss.each do |each_rss_result|
        result = { title: each_rss_result.title, 
                   date: each_rss_result.pubDate, 
                   link: each_rss_result.link, 
                   description: ActionView::Base.full_sanitizer.sanitize(each_rss_result.description) }
        rss_results[category_url[0].to_s.humanize].push(result)
      end
    end
    rss_results
  end

end
