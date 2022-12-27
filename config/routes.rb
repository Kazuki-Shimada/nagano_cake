Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :customers
  
  root to: "public/homes#top"
  
  namespace :public do
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :confirm, :withdrawal, :update]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :finish, :create, :index, :show]
  end
  namespace :admin do
    get 'homes/top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :edit, :show, :update]
    resources :orders, only: [:show, :update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
