Rails.application.routes.draw do
  devise_for :users , controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :stores do 
    resources :classifications
    resources :menus
    resources :desks
  end

  root "stores#index"
  get '/foods', to: 'menus#order_food'

  resource :cart, only: [:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

  resources :orders, only: [:create, :destroy] do
    member do
      get :checkout
      get :order_state
      post :pay
      post :serve
    end
  end

  post '/response/index', to: 'response#index'
end


