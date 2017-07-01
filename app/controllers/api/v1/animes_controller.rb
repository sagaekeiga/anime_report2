module Api
  module V1
    class AnimesController < ApplicationController
    skip_before_filter :verify_authenticity_token


      def index
         @animes = Anime.all.first(30)
         render json: @animes
      end
      
      
      def search
         params = request.body.read
         logger.debug("params")
         logger.debug(params)
         logger.debug("params")
         @animes = Anime.where("title like '%#{params}%'") if !params.nil?
         render json: @animes
      end
      
      def detail
         params = request.body.read
         logger.debug("params")
         logger.debug(params)
         logger.debug("params")
         @anime = Anime.find_by(title: params) if !params.nil?
         render json: @anime
      end
        
    end
  end
end