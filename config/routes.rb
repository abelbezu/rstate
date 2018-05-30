Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'listings#index'


  get '/statics/ie', to: 'statics#ie'
  get '/admin/users', to: 'admin#users'
  get '/admin/listings', to: 'admin#listings'
  get '/admin/agents', to: 'admin#agents'
  get '/admin/analytics', to: 'admin#analytics'

  resources :listings
  resources :statics
  resources :admin

end
