Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:index]
      resources :speeches, only:[:index, :create, :new, :show]
    root 'users#index'
    get 'search', to: 'search#search'
    #going to use cancan for nested resources
end
