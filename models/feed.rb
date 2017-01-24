require 'Nokogiri'
require 'open-uri'

class Feed

  attr_reader :source

  def initialize(source)
    @source = source
  end

  def get_data
    doc = Nokogiri::XML(open(@source))
    return doc
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



end