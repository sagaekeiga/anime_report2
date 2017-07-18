module Api
  module V1
    class LocatesController < ApplicationController
    skip_before_filter :verify_authenticity_token

      def search
         puts = params[:title]
         params = request.body.read
         logger.debug("params")
         logger.debug(params)
         logger.debug("params")
         logger.debug("OK")
         logger.debug(params["title"]["title"])
         logger.debug(params["content"])

         params = params.to_f
         puts params
         @locate = Locate.find_by(latitude: params) if !params.nil?
         render json: @locate
      end

    end
  end
end