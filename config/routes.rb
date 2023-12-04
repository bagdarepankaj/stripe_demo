Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :products
  resource :payments do
    get :return
    get :session_status
  end

  resource :cart, only: :show do
    get :add
    get :remove
  end
end
