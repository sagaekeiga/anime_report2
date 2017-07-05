module Api
  module V1
    class PagesController < ApplicationController
    skip_before_filter :verify_authenticity_token



      def bot
        params = request.body.read
        logger.debug("params")
        logger.debug(params)
        logger.debug("params")
        @bots = Bot.where("matching like '%#{params}%'")
        render json: @bots
      end
    
      def story
        params = request.body.read
        logger.debug("params")
        logger.debug(params)
        logger.debug("params")
        @stories = Story.where(w_title: params)
        render json: @stories
      end
    
      def channel
        params = request.body.read
        logger.debug("params")
        logger.debug(params)
        logger.debug("params")
        puts @channel = Channel.find_by(url: params)
        render json: @channel
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