Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :static_pages, only: [:show], param: :slug

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart, to: 'carts#add'
    end
  end

  resources :categories, only: [:index, :show] do
    member do
      get :products
    end
  end

  resources :accessories, only: [:index, :show]

  resource :cart, only: [:show] do
    patch :update_quantity, to: 'carts#update'
    delete :remove_item, to: 'carts#remove'
    get :checkout, to: 'carts#checkout'
    post :complete_order, to: 'orders#create'
  end

  resource :user_info, only: [:edit, :update]

  resources :orders, only: [:index, :show]

  root 'home#index'
end
