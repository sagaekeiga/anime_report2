namespace :sample do
  task :sample => :environment do
    require 'open-uri'
        doc = Nokogiri.HTML(open("http://tvanimedouga.blog93.fc2.com/"))
        puts "OK"
        
        ## タイムラインを取得
        doc.css('#mainBlock > div.index_area > div > div > a').each do |anime|
            
            puts "スタート"
            @anime = Anime.new
            url = anime[:href]

            #　各タイトルのURLを取得
            doc = Nokogiri.HTML(open("#{url}"))
            
            puts "タイトル"
            # 各動画のタイトル格納フェーズ
            puts @anime[:title] = doc.css('#mainBlock > div:nth-child(3) > div.mainEntryBase > div.mainEntryBody').inner_text unless anime[:href].to_s.include?("wikipedia")
            
            # 各動画のリンク格納フェーズ
            puts "リンクタイトル"
            doc.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntrykiji > a').each do |doc|
                puts doc.inner_text
                puts @anime[:ani] = doc[:href].to_s.match(%r{http://www.anitube.se/video.*$}) if !doc[:href].to_s.match(%r{http://www.anitube.se/video.*$}).nil?  #　アニチューブ
                puts @anime[:hima] = doc[:href].to_s.match(%r{http://himado.in/\d{6}}) if !doc[:href].to_s.match(%r{http://himado.in/\d{6}}).nil? #　ひまわり動画
                puts @anime[:daily] = doc[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}) if !doc[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}).nil? #　デイリーモーション
                puts @anime[:miomio] = doc[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}) if !doc[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}).nil? #　MioMio
                puts @anime[:b9] = doc[:href].to_s.match(%r{http://up.*$}) if !doc[:href].to_s.match(%r{http://up.*$}).nil? #　B9
                puts @anime[:youtube] = doc[:href].to_s.match(%r{https://www.youtube.com/watch.*$}) if !doc[:href].to_s.match(%r{https://www.youtube.com/watch.*$}).nil? #　Youtube
                puts @anime[:smove] = doc[:href].to_s.match(%r{http://say-move.org/comeplay.*$}) if !doc[:href].to_s.match(%r{http://say-move.org/comeplay.*$}).nil? #　Saymove
                puts @anime[:para] = doc[:href].to_s.match(%r{http://parasitestage.com/.*$}) if !doc[:href].to_s.match(%r{http://parasitestage.com/.*$}).nil? #　パラすて
            end
                @anime.save!
        end
  end
end