Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy] 
    get 'followers', to: 'users#followers', as: 'followers'
    get 'followings', to: 'users#followings', as: 'followings'
  end
  resources :posts, only: [:create, :destroy, :show, :index] do
    resource :favorites, only: [:create, :destroy]
  end
  get 'posts/category/:name', to: 'posts#category', as: 'posts_category'
  get 'timeline', to: 'posts#timeline', as: 'timeline'
  root 'home#top'
  get 'pr_records', to: 'home#index'
  get 'pr_show/:company_id/:release_id', to: 'home#show', as: 'pr-show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
