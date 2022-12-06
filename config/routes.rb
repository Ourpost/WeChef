Rails.application.routes.draw do
  devise_for :users

  resources :stores do 
    resources :menus
  end

  root "stores#index"
end
