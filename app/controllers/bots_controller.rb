class BotsController < ApplicationController
require 'open-uri'
    
    def scraping
        doc = Nokogiri.HTML(open("http://tvanimedouga.blog93.fc2.com/blog-entry-1028.html"))
        doc.css('#mainBlock > div.mainEntryBlock > div.mainEntryBase > div.mainEntrykiji > a').each do |anime|
            begin
                @bot = Bot.new
                @bot[:url] = anime[:href] unless anime[:href].to_s.include?("twitter") || anime[:href].to_s.include?("mixi.jp")
                @bot[:name] = anime.inner_text.gsub(/\p{Hiragana}行/, "")  unless anime.inner_text == "あまえないでよっ!!喝!!"
                @bot[:matching] = anime.inner_text.gsub(" ", "").gsub("　", "")
                @bot.save!
            rescue => e
            end
        end
        redirect_to bots_path
    end
    
    
    def index
        @bots = Bot.all.order("created_at").reverse
    end
    
    def edit
      @bot = Bot.find(params[:id])
    end
    
    def destroy
      @bot = Bot.find(params[:id])
        if @bot.delete
         flash[:success] = "deleted"
        end
        redirect_to bots_path
    end
end
