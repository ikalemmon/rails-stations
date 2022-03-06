Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  get '/movies' ,to:'movies#index'
  namespace :admin do
    #resources :movies
    get'/movies', to:'movies#index'
    get '/movies/new', to:'movies#new'
    post '/movies', to:'movies#create'##以上、station3まで
    get '/movies/:id',  to:'movies#edit' ,as:'movies_edit'
    put '/movies/:id', to: 'movies#update' ,as: 'movies_update'##station4
    delete '/movies/:id',to: 'movies#destroy'
  end
end
