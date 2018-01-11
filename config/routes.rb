Rails.application.routes.draw do


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :events

  root 'static_pages#home'
  delete '/join', to: 'events#leave'
  get '/join', to: 'events#join'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'login_sessions#new'
  post '/login', to: 'login_sessions#create'
  delete '/logout', to: 'login_sessions#destroy'
end
