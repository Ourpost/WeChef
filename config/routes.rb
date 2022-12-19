Rails.application.routes.draw do
  devise_for :users

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

  resources :orders, only: [:create] do
    member do
      get :checkout
    end
  end

  #get '/response', to: 'response#index'
  post '/response/aaa', to: 'response#aaa'
  post '/response/bbb', to: 'response#bbb'

end


