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


end