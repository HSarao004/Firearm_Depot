Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :static_pages, only: [:show], param: :slug
  resources :accessories, only: [:index, :show]
  root 'products#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show] do
    member do
      get :products
    end
  end
end
