Rails.application.routes.draw do
  
  devise_for :customers
  
  root to: "public/homes#top"
  
  namespace :public do
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :confirm, :withdrawal]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
