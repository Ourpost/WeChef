Rails.application.routes.draw do
  devise_for :users

  resources :stores do 
    resources :classifications
    resources :menus
  end

  root "stores#index"
end
