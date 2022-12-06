Rails.application.routes.draw do
  devise_for :users

  resources :stores do 
    resources :classifications do
      resources :menus
    end
  end

  root "stores#index"
end
