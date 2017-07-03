class ChannelsController < ApplicationController
require 'open-uri'

    def index
        @channels = Channel.all.order("created_at").reverse.first(100)
    end
    
    def scraping
        @urls2 = Story.all
        @urls2.each do |url2|
            begin

            doc = Nokogiri.HTML(open("#{url2.url}"))
            ## タイムラインを取得

            puts "スタート"
            @channel = Channel.new
            
            puts "タイトルとマッチング"
            # 各動画のタイトル格納フェーズ
            @channel[:title] = url2.s_title
            @channel[:url] = url2.url
            # @channel[:matching] = url2.s_title
            
            # 各動画のリンク格納フェーズ
            puts "リンクタイトル"
            doc.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntrykiji > a').each do |doc|
                @channel[:ani] = doc[:href].to_s.match(%r{http://www.anitube.se/video.*$}) if !doc[:href].to_s.match(%r{http://www.anitube.se/video.*$}).nil?  #　アニチューブ
                @channel[:hima] = doc[:href].to_s.match(%r{http://himado.in/\d{6}}) if !doc[:href].to_s.match(%r{http://himado.in/\d{6}}).nil? #　ひまわり動画
                @channel[:daily] = doc[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}) if !doc[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}).nil? #　デイリーモーション
                @channel[:miomio] = doc[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}) if !doc[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}).nil? #　MioMio
                @channel[:b9] = doc[:href].to_s.match(%r{http://up.*$}) if !doc[:href].to_s.match(%r{http://up.*$}).nil? #　B9
                @channel[:youtube] = doc[:href].to_s.match(%r{https://www.youtube.com/watch.*$}) if !doc[:href].to_s.match(%r{https://www.youtube.com/watch.*$}).nil? #　Youtube
                @channel[:smove] = doc[:href].to_s.match(%r{http://say-move.org/comeplay.*$}) if !doc[:href].to_s.match(%r{http://say-move.org/comeplay.*$}).nil? #　Saymove
                @channel[:para] = doc[:href].to_s.match(%r{http://parasitestage.com/.*$}) if !doc[:href].to_s.match(%r{http://parasitestage.com/.*$}).nil? #　パラすて
                @channel.save!
            end
            rescue => e
              puts "エラー"
            end
        end
    end
    
    def scraping2
        @urls2 = Story.all
        @urls2[8100..16000].each do |url2|
            begin

            doc = Nokogiri.HTML(open("#{url2.url}"))
            ## タイムラインを取得

            puts "スタート"
            @channel = Channel.new
            
            puts "タイトルとマッチング"
            # 各動画のタイトル格納フェーズ
            @channel[:title] = url2.s_title
            @channel[:url] = url2.url
            # @channel[:matching] = url2.s_title
            
            # 各動画のリンク格納フェーズ
            puts "リンクタイトル"
            doc.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntrykiji > a').each do |doc|
                @channel[:ani] = doc[:href].to_s.match(%r{http://www.anitube.se/video.*$}) if !doc[:href].to_s.match(%r{http://www.anitube.se/video.*$}).nil?  #　アニチューブ
                @channel[:hima] = doc[:href].to_s.match(%r{http://himado.in/\d{6}}) if !doc[:href].to_s.match(%r{http://himado.in/\d{6}}).nil? #　ひまわり動画
                @channel[:daily] = doc[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}) if !doc[:href].to_s.match(%r{http://www.dailymotion.com/video.*$}).nil? #　デイリーモーション
                @channel[:miomio] = doc[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}) if !doc[:href].to_s.match(%r{http://www.miomio.tv/watch.*$}).nil? #　MioMio
                @channel[:b9] = doc[:href].to_s.match(%r{http://up.*$}) if !doc[:href].to_s.match(%r{http://up.*$}).nil? #　B9
                @channel[:youtube] = doc[:href].to_s.match(%r{https://www.youtube.com/watch.*$}) if !doc[:href].to_s.match(%r{https://www.youtube.com/watch.*$}).nil? #　Youtube
                @channel[:smove] = doc[:href].to_s.match(%r{http://say-move.org/comeplay.*$}) if !doc[:href].to_s.match(%r{http://say-move.org/comeplay.*$}).nil? #　Saymove
                @channel[:para] = doc[:href].to_s.match(%r{http://parasitestage.com/.*$}) if !doc[:href].to_s.match(%r{http://parasitestage.com/.*$}).nil? #　パラすて
                @channel.save!
            end
            rescue => e
              puts "エラー"
            end
        end
    end
end
