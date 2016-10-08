Rails.application.routes.draw do
  devise_for :users

  resources :papers, only: :show do
    resources :comments, only: [:new,:create,:edit,:update,:destroy] do
      resources :likes, only: [:create,:destroy]
    end
    
    collection do
      get 'search'
    end
  root 'papers#index'
end
