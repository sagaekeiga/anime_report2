module Api
  module V1
    class LocatesController < ApplicationController
    skip_before_filter :verify_authenticity_token

      def search
         params = request.body.read
         params = JSON.parse(params)
         logger.debug("params")
         logger.debug(params)
         logger.debug("params")
         logger.debug("OK")
         logger.debug("title:" + params['title'].to_s)
         logger.debug("content:" + params['content'].to_s)

         params = params.to_f
         puts params
         @locate = Locate.find_by(latitude: params) if !params.nil?
         render json: @locate
      end

    end
  end
end