Rails.application.routes.draw do
  devise_for :users
  root 'trips#index'

  resources :trips do
    resources :locations, only: [:index, :new, :create, :destroy, :show, :edit, :update]
  end
  
  resources :locations do
    resources :addresses, only: [:index, :new, :create, :update, :destroy, :show, :edit ]
  end

end
