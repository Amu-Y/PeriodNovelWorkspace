Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  root to: "public#top"
  get 'about' => 'public#about'
  get 'instructions' => 'public#instructions'
  
  resources :users, only: [:create, :edit, :update, :destroy]
  resources :workspaces
  resources :words
end
