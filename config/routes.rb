Rails.application.routes.draw do
  resources :users
  resources :scores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'

  get '/scores', to: 'scores#index'
  post '/scores', to: 'scores#create'
  put '/scores/:id', to: 'scores#update'
  delete 'scores/:id', to: 'scores#destroy'

  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'

end
