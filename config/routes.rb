Rails.application.routes.draw do
  resources "images", only: [:index, :show, :upload, :delete, :update]
  root 'images#index'

  get '/images/:id', to: 'images#show', as: 'show'
  get '/images/upload'

  post '/images', to: 'images#upload'
  delete '/delete/:id', to: 'images#delete', as: 'delete'
  patch '/update/:id', to: 'images#update', as: 'update'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
