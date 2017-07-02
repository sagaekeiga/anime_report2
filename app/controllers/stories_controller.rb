class StoriesController < ApplicationController
require 'open-uri'
    
    def index
        @stories = Story.all.order("created_at").reverse.first(100)
    end

    def scraping
        @urls = Bot.all
        @urls.each do |url|
            begin
            doc = Nokogiri.HTML(open("#{url.url}"))
            
            doc.css('#mainBlock > div:nth-child(3) > div.mainEntryBase > div.mainEntrykiji > a').each do |anime2|
                @story = Story.new
                
                @story[:w_title] = url.name
                
                @story[:url] = anime2[:href] unless anime2[:href].to_s.include?("twitter") || 
                anime2[:href].to_s.include?("mixi.jp") || anime2.inner_text.include?("人気blog") || anime2.to_s.include?("人気ランキング") || 
                anime2.inner_text.include?("アニメランキング") || anime2.inner_text.include?("放送直前スペシャル") || anime2.inner_text.include?("PV") ||
                anime2.inner_text.include?("OVA")
                    
                @story[:s_title] = anime2.inner_text.gsub(/【[a-zA-Z]++】/, "").gsub(/【^[A-Z]+$】/, "") unless  anime2.inner_text.include?("人気blog") || anime2.inner_text.include?("人気ランキング") || 
                anime2.inner_text.include?("アニメランキング") || anime2.inner_text.include?("放送直前スペシャル") || anime2.inner_text.include?("PV") ||
                anime2.inner_text.include?("OVA")
                
                @story[:matching] = anime2.inner_text.gsub(" ", "").gsub("　", "")
                
                @story.save!
            end
            rescue => e
            end
        end
        
        redirect_to stories_path
    end
end
