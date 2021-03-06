Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  namespace :admin do
    resources :products do
      member do
        patch :move_up
        patch :move_down
      end
    end
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
    resources :categories
  end

  resources :products do
    member do
      post :add_to_cart
    end
    collection do
      get :search
    end
  end

  resources :carts do
    collection do
      delete :clean
        post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  resources :cart_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 namespace :account do
   resources :orders
 end
end
