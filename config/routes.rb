Rails.application.routes.draw do
  get 'pages/bot'

  get 'pages/story'

  get 'pages/channel'

  root 'animes#index'
  get 'animes/scraping'
  get 'bots/scraping'
  get 'stories/scraping'
  get 'channels/scraping'
  
  resources :animes
  resources :bots
  resources :stories
  resources :channels
  
  namespace :api, { format: 'json' } do
    namespace :v1, { format: 'json' } do 
      post 'animes/search'
      post 'animes/detail'
      resources :animes
    end
  end
end
