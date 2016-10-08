Rails.application.routes.draw do
  devise_for :users

  root 'papers#index'

  resources :papers, only: :show do
    resources :comments, only: [:new,:create,:edit,:update,:destroy] do
      resources :likes, only: [:create,:destroy]
    end
    collection do
      get 'search'
    end
  end

  resources :users, only: :show
  
end
