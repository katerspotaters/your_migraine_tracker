Rails.application.routes.draw do

  resources :medications
  devise_for :users

  get "welcome/index"

  get "welcome/about"

  root 'welcome#index'

  resources :users, only: :show do
    resources :medications, only: [:create, :edit, :destroy, :update, :new]
    resources :migraines, only: [:create, :destroy, :new] do
      resources :surveys, only: [:create, :destroy, :new]
    end
  end
end
