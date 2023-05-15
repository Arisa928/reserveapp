Rails.application.routes.draw do
  
  get 'home/index'
  
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  get "/" => "home#index"
  get "/index" => "home#index"
 
  resources :users do
    member do
      get 'account'
    end
    collection do
      get 'search'
    end
    get 'users/:account',controller: 'users', action: 'show'
  end
  
  resources :home
  
  resources :rooms do
    collection do
      get :'search'
      get :'allroom'
    end
  end  


  resources :reservations do
    collection do
      post :confirm
    end
  end  
  
end

