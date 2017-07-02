class PagesController < ApplicationController
  def bot
    @bots = Bot.all
  end

  def story
    @stories = Story.where(w_title: params[:matching])
  end

  def channel
    @channel = Channel.find_by(url: params[:url])
  end
end
