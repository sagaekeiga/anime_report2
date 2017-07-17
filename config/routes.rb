Rails.application.routes.draw do
  get 'pages/bot'

  get 'pages/story'

  get 'pages/channel'

  root 'locates#index'
  get 'animes/scraping'
  get 'bots/scraping'
  get 'stories/scraping'
  get 'stories/scraping2'
  get 'channels/scraping'
  get 'channels/scraping2'

  resources :animes
  resources :bots
  resources :stories
  resources :channels
  resources :locates
  
  namespace :api, { format: 'json' } do
    namespace :v1, { format: 'json' } do 
      post 'pages/bot'
      post 'pages/story'
      post 'pages/channel'
      post 'animes/search'
      post 'animes/detail'
      post 'locates/search'
      resources :animes
    end
  end
end
