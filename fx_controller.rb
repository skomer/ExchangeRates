require 'open-uri'
require 'Nokogiri'

doc = Nokogiri::XML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))

bla = doc.css("Cube Cube Cube")

# prints aaaaall the lists of these elements
# puts "bla", bla 

# blo = doc.css("Cube")

# puts "blo", blo.Cube.first["time"]

bli = doc.xpath('//xmlns:Cube')[0].elements

bli.each do |yay|
  puts yay.attribute('time')
end


# prints the "time" attribute of that first element
blo = doc.xpath('//xmlns:Cube')[0].elements[5].attribute('time')


puts "blo", blo