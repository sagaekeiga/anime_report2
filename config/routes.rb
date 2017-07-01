Rails.application.routes.draw do
  root 'animes#index'
  get 'animes/scraping'
  resources :animes
  
  namespace :api, { format: 'json' } do
    namespace :v1, { format: 'json' } do 
      post 'animes/search'
      post 'animes/detail'
      resources :animes
    end
  end
end
