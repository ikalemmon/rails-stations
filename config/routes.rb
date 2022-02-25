Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  get '/movies' ,to:'movies#index'
  namespace :admin do
    #resources :movies
    get'/movies', to:'movies#index'
    get '/movies/new', to:'movies#new'
    post '/movies', to:'movies#create'
  end
end
