require 'nokogiri'
require 'open-uri'


doc = Nokogiri.HTML(open("http://tvanimedouga.blog93.fc2.com/"))


## タイムラインを取得
doc.css('#mainBlock > div.index_area > div > div > a').each do |anime|
    puts url = anime[:href]
    puts anime.inner_text
    
    #　各タイトルのURLを取得
    doc = Nokogiri.HTML(open("#{url}"))
    
    # 各動画のタイトル格納フェーズ
    puts "タイトル"
    puts doc.css('#mainBlock > div:nth-child(3) > div.mainEntryBase > div.mainEntryBody').inner_text
    
    
    # 各動画のリンク格納フェーズ
    puts "リンクタイトル"
    doc.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntrykiji > a').each do |doc|
        puts doc.inner_text
        puts doc[:href].to_s.match(%r{http://www.anitube.se/video.*$}) #　アニチューブ
        puts doc[:href].to_s.match(%r{http://himado.in/\d{6}}) #　ひまわり動画
        puts doc[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}) #　デイリーモーション
        puts doc[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}) #　MioMio
        puts doc[:href].to_s.match(%r{http://up.*$}) #　B9
        puts doc[:href].to_s.match(%r{https://www.youtube.com/watch.*$}) #　Youtube
        puts doc[:href].to_s.match(%r{http://say-move.org/comeplay.*$}) #　Saymove
        puts doc[:href].to_s.match(%r{http://parasitestage.com/.*$}) #　パラすて
    end
    
    
end
