Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :comments, only:[:index]
  resources :users, only:[:index]
    resources :speeches
    root 'users#index'
    get 'search', to: 'search#search'
    get 'speeches', to: 'speeches#all_comments'
end
