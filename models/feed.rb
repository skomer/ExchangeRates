require 'Nokogiri'
require 'open-uri'
require_relative 'fx_rate'

class Feed

  attr_reader :source

  def initialize(source)
    @source = source
  end

  def get_data
    return doc = Nokogiri::XML(open(@source))
  end

  def parse_xml
    rates_by_date = {}
    doc = get_data()
    date_elements = doc.xpath('//xmlns:Cube')[0]
    date_elements.children.each do |date|
      rates_by_date[date["time"]] = {}
      date.children.each do |currency_rate|
        currency = currency_rate.attributes["currency"].value
        rate = currency_rate.attributes["rate"].value
        rates_by_date[date["time"]][currency] = rate
      end
    end
    return rates_by_date
  end

  def construct_and_save_fx_rates_objects
    rates_by_date = parse_xml()
    rates_by_date.each do |date, currency_rate|
      currency_rate.each do |currency, rate|
        options = {
          'rate_date' => date,
          'currency' => currency,
          'rate' => rate
        }
        fx_rate = FxRate.new(options)
        fx_rate.save()
      end
    end
  end



end














