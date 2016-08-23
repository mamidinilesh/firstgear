Rails.application.routes.draw do


resources :vehicles
 resources :brands


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  #  root '/layouts',layouts#application'
#  get '/brand',  to: 'brands#new'
    get  '/brand',  to: 'brand#new'
    get '/vehicle', to:'vehicle#new'

end
