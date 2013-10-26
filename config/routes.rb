Stich::Application.routes.draw do
  root 'authentications#new'

  get '/auth/:provider/callback' => 'googleauth#create'

  # New, create, destroy routes for Authentications controller
  get 'authentications/new' => 'authentications#new'
  post 'authentications' => 'authentications#create'
  delete 'authentications' => 'authentications#destroy'

  # New and create routes for Users controller
  get 'authentications/new' => 'users#new'
  post 'users' => 'users#create'

  resources :timers
end

