Rails.application.routes.draw do
  devise_for :users

  resources :stores do 
    resources :classifications
    resources :menus
    resources :desks
  end

  root "stores#index"
  
  get '/desks', to: 'menus#order'
end


