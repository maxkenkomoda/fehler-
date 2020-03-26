Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  #ログインのルーティング
  get 'login',to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #会員登録のルーティン
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
end
