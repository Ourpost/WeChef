Rails.application.routes.draw do
  devise_for :users

  resources :stores do 
    resources :classifications
    resources :menus do
      resources :orders  
    end
  end

  root "stores#index"
end


