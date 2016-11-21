Rails.application.routes.draw do
  devise_for :users
  resources :comments, only:[:index]
  resources :users, only:[:index]
      resources :speeches, only:[:index, :create, :new, :show]
    root 'users#index'
    get 'search', to: 'search#search'
    get 'speeches', to: 'speeches#all_comments'
    #going to use cancan for nested resources
end
