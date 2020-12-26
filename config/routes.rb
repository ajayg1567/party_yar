Rails.application.routes.draw do
  devise_for :admins
  get 'user_feedbacks/new'
  post '/rate' => 'rater#create', :as => 'rate'
  root to: 'home#index'
  get 'home/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :super_categories
  resources :gift_types, only: :show do
    collection do
      get :sorting
    end
  end
  resources :occasions, only: :show

  post '/purchase' => 'orders#purchase_status'
 
  
  resources :products do
    collection do
      get :get_location
    end
  end
  post '/add_to_cart/:product_id' => 'cart#add_to_cart', :as => 'add_to_cart'
  post '/cart_addon/:product_id' => 'cart#cart_addon', :as => 'cart_addon'
  get '/remove/:item_id' => 'cart#remove', :as => 'remove'
  get 'checkout' => 'checkout#index'
  get '/ratings/new' => 'user_feedback#new'
  get '/change_order_details/:id' => 'checkout#change_order_details'
  resources :profile, only: [:edit]
  get 'my-account' => 'my_account#index'
  get 'my-account/:id/profile-edit' => 'my_account#edit_profile', as: :profile_edit
  patch 'my-account/:id/profile-edit' => 'my_account#update_profile',as: :update_profile
  get 'my-account/:id/change-password' => 'my_account#change_password', as: :change_password
  get 'my-account/orders' => 'orders#index', as: :my_orders
  get 'search' => 'super_categories#search', as: :search
  get '/get_time_slots' => 'products#get_time_slots'
  get '/update_delivery' => 'checkout#update_delivery'
  get '/update_add_ons' => 'checkout#update_add_ons'
  get '/remove_add_on' => 'checkout#remove_add_on'
  post '/add_reviews'  => 'orders#add_reviews'
  get '/reviews/:id'  => 'orders#reviews'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'new_address' => 'my_account#create_new'
  get 'get_address' => 'myaccount#new'
  namespace :admin do
    get '/' => 'dashboard#index'
    get '/invoice_show/:id' => 'orders#invoice_show', :as => 'invoice_show'
  	resources :shipping_methods
  	resources :users, only: [:index, :show]
    resources :sub_categories
    resources :categories
    resources :super_categories
    resources :orders,only: [:index,:show,:edit,:destroy] do
      patch :update_status
    end
    resources :products do
      collection do
        post :import
        get :import_form
      end
    end
    resources :add_ons
    resources :gift_types
    resources :occasions, except: :show
  end
end
