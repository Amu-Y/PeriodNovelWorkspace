Rails.application.routes.draw do
  devise_for :users

  root to: "public#top"
  get 'about' => 'public#about'
  get 'instructions' => 'public#instructions'
  # 会員機能
  resources :users, only: [:create, :update, :destroy]
  # 執筆機能
  resources :workspaces do
    resources :novels, only: [:create, :update, :destroy]
    resources :words, only: [:create, :update, :destroy]
  end
  
end
