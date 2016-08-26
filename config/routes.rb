Rails.application.routes.draw do







  # get 'vendor_contracts/_form'
  #
  # get 'vendor_contracts/edit'
  #
  # get 'vendor_contracts/index'
  #
  # get 'vendor_contracts/new'
  #
  # get 'vendor_contracts/show'
  #
  # get 'vendors/_form'
  #
  # get 'vendors/edit'
  #
  # get 'vendors/index'
  #
  # get 'vendors/new'
  #
  # get 'vendors/show'
  #
  # get 'vendor_types/_form'
  #
  # get 'vendor_types/edit'
  #
  # get 'vendor_types/index'
  #
  # get 'vendor_types/new'
  #
  # get 'vendor_types/show'
  #
  # get 'rate_cards/_form'
  #
  # get 'rate_cards/edit'
  #
  # get 'rate_cards/index'
  #
  # get 'rate_cards/new'
  #
  # get 'rate_cards/show'
  #
  # get 'vendor_type/_form'
  #
  # get 'vendor_type/edit'
  #
  # get 'vendor_type/index'
  #
  # get 'vendor_type/new'
  #
  # get 'vendor_type/show'
  #
  # get 'vendor_contract/_form'
  #
  # get 'vendor_contract/edit'
  #
  # get 'vendor_contract/index'
  #
  # get 'vendor_contract/new'
  #
  # get 'vendor_contract/show'
  #
  # get 'vendor/_form'
  #
  # get 'vendor/edit'
  #
  # get 'vendor/index'
  #
  # get 'vendor/new'
  #
  # get 'vendor/show'

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
 resources :vendors
 resources :vendor_contracts
 resources :vendor_types
 resources :rate_cards


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
