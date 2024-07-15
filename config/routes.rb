Rails.application.routes.draw do
  # Devise routes for Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Devise routes for Users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define logout route explicitly
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :static_pages, only: [:show], param: :slug
  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show] do
    member do
      get :products
    end
  end
  resources :accessories, only: [:index, :show]
  resource :user_info, only: [:edit, :update]

  root 'home#index'
end
