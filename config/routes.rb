Stich::Application.routes.draw do
  root 'authentications#new'
  # New, create, destroy for Authentications controller
  get 'authentications/new' => 'authentications#new'
  post 'authentications' => 'authentications#create'
  delete 'authentications/:id' => 'authentications#destroy'

  resources :timers, :users
end

