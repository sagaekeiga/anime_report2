require 'nokogiri'
require 'open-uri'


doc = Nokogiri.HTML(open("http://tvanimedouga.blog93.fc2.com/blog-entry-1028.html"))

# @urls = []
# ## 一覧を取得
# puts "一覧"
# doc.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntrykiji > a').each do |anime|
#     @urls.push(anime[:href]) unless anime[:href].to_s.include?("twitter") || anime[:href].to_s.include?("mixi.jp")
#     puts anime.inner_text
# end

# puts "詳細"
# @urls2 = []
# @urls.first(116).each do |url|
#     begin
#     doc = Nokogiri.HTML(open("#{url}"))
    
#     doc.css('#mainBlock > div:nth-child(3) > div.mainEntryBase > div.mainEntrykiji > a').each do |anime2|
#             @urls2.push(anime2[:href]) unless anime2[:href].to_s.include?("twitter") || 
#             anime2[:href].to_s.include?("mixi.jp") || anime2.inner_text.include?("人気blog") || anime2.to_s.include?("人気ランキング") || 
#             anime2.inner_text.include?("アニメランキング") || anime2.inner_text.include?("放送直前スペシャル") || anime2.inner_text.include?("PV") ||
#             anime2.inner_text.include?("OVA")
            
#             puts anime2.inner_text unless  anime2.inner_text.include?("人気blog") || anime2.inner_text.include?("人気ランキング") || 
#             anime2.inner_text.include?("アニメランキング") || anime2.inner_text.include?("放送直前スペシャル") || anime2.inner_text.include?("PV") ||
#             anime2.inner_text.include?("OVA")
#     end
#     rescue => e
#     end
# end
# p @urls2.count

# puts "各話のリンク先"

@urls2.each do |url2|
    begin
    doc = Nokogiri.HTML(open("#{url2}"))
    ## タイムラインを取得
    doc.css('#mainBlock > div.index_area > div > div > a').each do |anime|
        
        puts "スタート"
        url = anime[:href]
    
        #　各タイトルのURLを取得
        doc = Nokogiri.HTML(open("#{url}"))
        
        puts "タイトル"
        # 各動画のタイトル格納フェーズ
        puts doc.css('#mainBlock > div:nth-child(3) > div.mainEntryBase > div.mainEntryBody').inner_text
        
        # 各動画のリンク格納フェーズ
        puts "リンクタイトル"
        doc.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntrykiji > a').each do |doc|
            p doc[:href].to_s.match(%r{http://www.anitube.se/video.*$}) if !doc[:href].to_s.match(%r{http://www.anitube.se/video.*$}).nil?  #　アニチューブ
            p doc[:href].to_s.match(%r{http://himado.in/\d{6}}) if !doc[:href].to_s.match(%r{http://himado.in/\d{6}}).nil? #　ひまわり動画
            p doc[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}) if !doc[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}).nil? #　デイリーモーション
            p doc[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}) if !doc[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}).nil? #　MioMio
            p doc[:href].to_s.match(%r{http://up.*$}) if !doc[:href].to_s.match(%r{http://up.*$}).nil? #　B9
            p doc[:href].to_s.match(%r{https://www.youtube.com/watch.*$}) if !doc[:href].to_s.match(%r{https://www.youtube.com/watch.*$}).nil? #　Youtube
            p doc[:href].to_s.match(%r{http://say-move.org/comeplay.*$}) if !doc[:href].to_s.match(%r{http://say-move.org/comeplay.*$}).nil? #　Saymove
            p doc[:href].to_s.match(%r{http://parasitestage.com/.*$}) if !doc[:href].to_s.match(%r{http://parasitestage.com/.*$}).nil? #　パラすて
        end
    end
    rescue => e
      puts "エラー"
    end
end