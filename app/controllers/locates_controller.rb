class LocatesController < ApplicationController

require 'open-uri'
require 'net/http'
require 'uri'
require 'json'
require "bigdecimal"
require "bigdecimal/util"

    DISTANCE_API = "http://vldb.gsi.go.jp/sokuchi/surveycalc/surveycalc/bl2st_calc.pl?"


    def data_url
      doc = Nokogiri.HTML(open("http://www.ekidata.jp/api/s/"))
      
        doc.css('a').each do |url|
          begin
              if url[:href].include?("json")
                @locate = Locate.new
                @locate[:url] = "http://www.ekidata.jp/api/s/" + url[:href]
                @locate.save
              end
          rescue => e
            puts "エラー"
          end
      end
      redirect_to root_path
    end
    
    def data_other
      @locates = Locate.all
      @locates.each do |locate|
        @locate = Locate.find_by(url: locate.url)
        uri = URI.parse("#{locate.url}")
        json = Net::HTTP.get(uri).gsub("if(typeof(xml)=='undefined') xml = {};", "").gsub("xml.data = ", "").gsub("if(typeof(xml.onload)=='function') xml.onload(xml.data);", "")
        
        result = JSON.parse(json)
        puts json = result['station']
        puts @locate[:name] = json[0]['station_name']
        puts @locate[:pref_cd] = json[0]['pref_cd']
        puts @locate[:latitude] = json[0]['lat']
        puts @locate[:longitude] = json[0]['lon']
        @locate.save
      end
      redirect_to root_path
    end
    
    def data_com
      distance_api = "http://vldb.gsi.go.jp/sokuchi/surveycalc/surveycalc/bl2st_calc.pl?"
      n = 0
      
      @locates = Locate.all
      @locates.each do |locate|
        
        req_params = {
          outputType: "json",    # 出力タイプ
          ellipsoid:  "bessel",  # 楕円体
          latitude1:  38.2446966,      # 出発点緯度
          longitude1: 140.9180064,      # 出発点経度
          latitude2:  locate.latitude,      # 到着点緯度
          longitude2: locate.longitude       # 到着点経度
        }
        req_param = req_params.map { |k, v| "#{k}=#{v}" }.join("&")
        result = JSON.parse(open(distance_api + req_param).read)
        dist = result["OutputData"]["geoLength"]
        
        if dist.to_f < 1000
            n = n + 1
            puts = n
        end
        
      end
      
      redirect_to root_path
    end
    
    def geo
      @locates = Locate.all.closest(origin: [35.689407, 139.700306])
      @locates.each do |locate|
        puts locate.name
      end
      # @withins = []
      # @locates = Locate.all.within(0.5, origin: [35.689407, 139.700306])
      # @locates.each do |locate|
      #     puts locate.name
      #     req_params = {
      #       outputType: "json",    # 出力タイプ
      #       ellipsoid:  "bessel",  # 楕円体
      #       latitude1:  35.689407,      # 出発点緯度
      #       longitude1: 139.700306,      # 出発点経度
      #       latitude2:  locate.latitude,      # 到着点緯度
      #       longitude2: locate.longitude       # 到着点経度
      #     }
      #     req_param = req_params.map { |k, v| "#{k}=#{v}" }.join("&")
      #     result = JSON.parse(open(DISTANCE_API + req_param).read)
          

      #     if result["OutputData"]["geoLength"].to_i.to_s.length < 4
      #       a = result["OutputData"]["geoLength"].to_i
      #       puts a.to_s + "m"
      #     elsif result["OutputData"]["geoLength"].to_i.to_s.length > 3
      #       a = result["OutputData"]["geoLength"].to_f * 0.001
      #       puts a.to_d.truncate(1).to_f.to_s + "km"
      #     end
          
      #     @withins.push(result["OutputData"]["geoLength"])
      # end
      redirect_to root_path
    end
    
    
    
    def index
      @locates = Locate.all
    end
    
    def new
        @locate = Locate.new
    end
    
    def create
     @locate = Locate.new(locate_params)
     if @locate.save
       redirect_to root_path
     else
       render 'locates/new'
     end
    end
    
    def edit
      @locate = Locate.find(params[:id])
    end
    
    def destroy
      @locate = Locate.find(params[:id])
        if @locate.delete
         flash[:success] = "deleted"
        end
        redirect_to root_path
    end
    
    def show
      @locate = Locate.find(params[:id])
    end
    
    def update
        @locate = Locate.find(params[:id])
        @locate.update(locate_params)
        redirect_to root_path
    end
    
      private
      
        def locate_params
          params.require(:locate).permit(:name, :latitude, :longitude)
        end
end
