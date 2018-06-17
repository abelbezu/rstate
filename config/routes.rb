Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'listings#index'


  get '/admin/users', to: 'admin#users'
  get '/admin/listings', to: 'admin#listings'
  get '/admin/agents', to: 'admin#agents'
  get '/admin/analytics', to: 'admin#analytics'
  get '/agentregistration', to: 'agents#new'
  get 'search', to: 'listings#search_results'
  get 'account', to: 'users#show'

  post '/images/upload', to: 'images#upload'
  patch '/images/upload', to: 'images#upload'
  post '/images/remove_image', to: 'images#remove_image'
  patch '/images/remove_image', to: 'images#remove_image'

  resources :listings
  resources :statics
  resources :admin
  resources :agents
  resources :users

end
