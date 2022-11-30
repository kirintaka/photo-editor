Rails.application.routes.draw do
  root 'web_pages#index'
  resources 'web_pages', only: [:index]
  resources "images", only: [:show, :upload, :delete, :update]

  get '/images', to: 'web_pages#index'
  get '/images/:id', to: 'images#show', as: 'show'
  get '/images/upload'

  post '/images', to: 'images#create'
  delete '/delete/:id', to: 'images#delete', as: 'delete'
  patch '/update/:id', to: 'images#update', as: 'update'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
