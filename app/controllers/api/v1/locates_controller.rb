module Api
  module V1
    class LocatesController < ApplicationController
    skip_before_filter :verify_authenticity_token

      def search
         logger.debug(params[:latitude])
         logger.debug(params[:longitude])
         @latitude = params[:latitude]
         @longitude = params[:longitude]
         
         @locates = Locate.all.closest(origin: [@latitude.to_f, @longitude.to_f])
         @locates.each do |locate|
             @locate = locate
             
        #   req_params = {
        #      outputType: "json",    # 出力タイプ
        #      ellipsoid:  "bessel",  # 楕円体
        #      latitude1:  @latitude.to_f,      # 出発点緯度
        #      longitude1: @longitude.to_f,      # 出発点経度
        #      latitude2:  locate.latitude,      # 到着点緯度
        #      longitude2: locate.longitude       # 到着点経度
        #   }
        #   req_param = req_params.map { |k, v| "#{k}=#{v}" }.join("&")
        #   result = JSON.parse(open(DISTANCE_API + req_param).read)
          

        #   if result["OutputData"]["geoLength"].to_i.to_s.length < 4
        #      a = result["OutputData"]["geoLength"].to_i
        #      puts @distance = a.to_s + "m"
        #   elsif result["OutputData"]["geoLength"].to_i.to_s.length > 3
        #      a = result["OutputData"]["geoLength"].to_f * 0.001
        #      puts @distance = a.to_d.truncate(1).to_f.to_s + "km"
        #   end
           
           
         end

         render json: @locate
      end

    end
  end
end