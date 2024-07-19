Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    # This route handles user sign-out
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  # Static pages
  resources :static_pages, only: [:show], param: :slug

  # Products routes with custom action to add products to the cart
  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
    end
  end

  # Categories routes with a custom action to list products by category
  resources :categories, only: [:index, :show] do
    member do
      get :products
    end
  end

  # Accessories routes
  resources :accessories, only: [:index, :show]

  # User info route for editing and updating user details
  resource :user_info, only: [:edit, :update]

  # Cart routes for showing the cart, updating item quantities, and removing items
  resource :cart, only: [:show] do
    patch :update_quantity
    delete :remove_item,param: :id
  end

  # Root route
  root 'home#index'
end
