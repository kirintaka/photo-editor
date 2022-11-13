Rails.application.routes.draw do
  resources "images", only: [:index, :show, :upload]
  root 'images#index'
  get '/images/upload'
  post '/images', to: 'images#upload'
  get '/images/:id', to: 'images#show', as: 'show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
