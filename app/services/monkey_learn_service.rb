require 'monkeylearn'

class MonkeyLearnService < BaseService
  
  attr_reader :params

  def initialize(params, channel)
    @params = params
  end

  private

  def self.get_image_url_from_description(description)
    begin
      r = Monkeylearn.extractors.extract('ex_owGiMc4z', [description])
      r.result.present? ? (r.result.first.present? && !r.result.first.empty?) ? (r.result.first.second.present? && !r.result.first.second.empty?) ? r.result.try(:first).try(:second)["parsed_value"] : nil : nil : nil
    rescue => e
      puts e
    end

  end

end
