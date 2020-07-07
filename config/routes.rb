Rails.application.routes.draw do

  get '/critters/bugs', to: "critters#bug_index", as: "bugs_path"
  get '/critters/fish', to: "critters#fish_index", as: "fish_path"
  get '/critters/sea-creatures', to: "critters#sea_creature_index", as: "sea_creatures_path"

  get '/users/', to: 'users#index'
  get '/users/stay_logged_in', to: 'users#stay_logged_in'
  get '/users/:id', to: 'users#show'
  patch '/users/:id', to: 'users#update'
  post '/users/login', to: 'users#login'
  post '/users', to: 'users#create'
  delete '/users/:id', to: 'users#destroy'
  
  post '/user-critters', to: 'user_critters#create'
  delete '/user-critters/:id', to: 'user_critters#destroy'

  # resources :user_critters
  # resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
