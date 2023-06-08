Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, only: %i[index show create]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
