Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  #ログインのルーティング
  get 'login',to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #会員登録のルーティン
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
    member do
      get :like
    end
  end
  
  #POSTのルーティング
  resources :posts, only: [:new, :create, :destroy, :edit, :update, :show]
  resources :favorites, only: [:create, :destroy]
  
  get 'ranking', to: 'posts#ranking'
end
