Rails.application.routes.draw do







  # get 'service/region'
  #
  # get 'service/name:string'
  #
  # get 'service/category:references'
  #
  # get 'service/default_commission:integer'
  #
  # get 'service/active:boolean'
  #
  # get 'regions/_form'
  #
  # get 'regions/edit'
  #
  # get 'regions/index'
  #
  # get 'regions/new'
  #
  # get 'regions/show'
  #
  # get 'cities/_form'
  #
  # get 'cities/edit'
  #
  # get 'cities/index'
  #
  # get 'cities/new'
  #
  # get 'cities/show'
  #
  # get 'city/_form'
  #
  # get 'city/edit'
  #
  # get 'city/index'
  #
  # get 'city/new'
  #
  # get 'city/show'
  #
  # get 'states/_form'
  #
  # get 'states/edit'
  #
  # get 'states/index'
  #
  # get 'states/new'
  #
  # get 'states/show'
  #
  # get 'services/_form'
  #
  # get 'services/edit'
  #
  # get 'services/index'
  #
  # get 'services/new'
  #
  # get 'services/show'

resources :vehicles
 resources :brands
 resources :categories
 resources :services
 resources :states
 resources :cities
 resources :regions


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  root 'application#hello'
  root 'static_pages#home'
  #  root '/layouts',layouts#application'
#  get '/brand',  to: 'brands#new'
    get  '/brand',  to: 'brand#new'
    get '/vehicle', to:'vehicle#new'
    get '/category', to:'category#new'
    get '/service', to:'service#new'
    get '/state', to:'state#new'
    get '/city', to:'city#new'
    get '/region', to:'region#new'

end
