require 'nokogiri'
require 'open-uri'
require 'geokit-rails'


# doc = Nokogiri.HTML(open("http://www.gsi.go.jp/KOKUJYOHO/center.htm"))

# n = 0
# doc.css('table').each do |url|
    
#     begin
#      url.css('a').each do |a|
#          if a[:href].include?("http://www.gsi.go.jp/KOKUJYOHO/CENTER/kendata/")
#          puts n = n + 1
#          puts a.inner_text
#          puts a[:href]
#          end
#      end
#     rescue => e
#       puts "エラー"
#     end
# end

@locates = Locate.within(5, origin: [38.2446966, 140.9180064])
@locates.each do |locate|
    puts locate.name
end
