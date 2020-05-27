Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  get 'posts/show'
  get 'posts/destroy'
  get 'categories/create'
  get 'categories/index'
  get 'products/index'
  get 'products/show'
  root 'home#top'
  # selectアクションで生産者かバイヤーか選択しルートを変える
  get 'sign_up' => 'home#select'
  get 'about' => 'home#about'
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  devise_for :buyers, skip: :all
  devise_scope :buyer do
    get 'buyers/sign_in' => 'buyers/sessions#new', as: 'new_buyer_session'
    post 'buyers/sign_in' => 'buyers/sessions#create', as: 'buyer_session'
    delete 'buyers/sign_out' => 'buyers/sessions#destroy', as: 'destroy_buyer_session'
    get 'buyers/sign_up' => 'buyers/registrations#new', as: 'new_buyer_registration'
    post 'buyers/sign_up' => 'buyers/registrations#create', as: 'buyer_registration'
  end
  devise_for :producers, skip: :all
  devise_scope :producer do
    get 'producers/sign_in' => 'producers/sessions#new', as: 'new_producer_session'
    post 'producers/sign_in' => 'producers/sessions#create', as: 'producer_session'
    delete 'producers/sign_out' => 'producers/sessions#destroy', as: 'destroy_producer_session'
    get 'producers/sign_up' => 'producers/registrations#new', as: 'new_producer_registrartion'
    post 'producers/sign_up' => 'producers/registrations#create', as: 'producer_registration'
  end
  namespace :producer do
    resources :producers, only:[:show, :edit, :update, :quit, :index]
  end

  namespace :buyer do
    resources :buyers, only:[:show, :edit, :update, :quit, :index]
  end

  resources :products
  resources :categories, only:[:index, :create, :destroy]
  resources :posts, except:[:update, :edit]


  get 'producers' => 'producer/producers#index', as: 'producers'
  get 'producers/:id' => 'producer/producers#show', as: 'producer'
  get 'producers/:id/edit' => 'producer/producers#edit', as: 'edit_producer'
  patch 'producers/:id' => 'producer/producers#update'
  get 'producers/:id/quit' => 'producer/producers#quit', as: 'producer_quit'

  get 'buyers' => 'buyer/buyers#index', as: 'buyers'
  get 'buyers/:id' => 'buyer/buyers#show', as: 'buyer'
  get 'buyers/:id/edit' => 'buyer/buyers#edit', as: 'edit_buyer'
  patch 'buyers/:id' => 'buyer/buyers#update'
  get 'buyers/:id/quit' => 'buyer/buyers#quit', as: 'buyer_quit'

  namespace :buyer do
    get 'orders/new'
    get 'orders/create'
    # get 'orders/confirm'
    # get 'orders/completed'
    # get 'orders/index'
    # get 'orders/show'
    # get 'orders/update'
  end
  # namespace :producer do
    # get 'orders/index'
    # get 'orders/show'
    # get 'orders/update'
    # get 'orders/confirm'
    # get 'orders/completed'
  # end

  # get 'products/index'
  # get 'products/show'
  # get 'buyers/show'
  # get 'buyers/edit'
  # get 'buyers/update'
  # get 'buyers/quit'
  # get 'buyers/index'
  # get 'producers/show'
  # get 'producers/edit'
  # get 'producers/update'
  # get 'producers/quit'
  # get 'producers/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
