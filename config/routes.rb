Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  root to: 'homes#about'
  get 'homes/top' => 'homes#top'
  get 'homes/enter' => 'homes#enter'

  get 'users/my_page' => 'users#mypage'
  get 'users/unsubscribe' => 'users#unsubscribe'
  resources :users, only: [:index, :show, :edit, :update,:destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get '/reviews/get_category/children', to: 'reviews#get_category_children', defaults: { format: 'json' }
  get '/reviews/get_category/grandchildren', to: 'reviews#get_category_grandchildren', defaults: { format: 'json' }
  get '/reviews/tags/:id' => 'reviews#tag_show'
  get '/reviews/hot_reviews' => 'reviews#hot_reviews'
  get '/reviews/new_reviews' => 'reviews#new_reviews'
  patch '/reviews/:id' => 'reviews#update'
  resources :reviews, only: [:index, :show, :new, :create, :edit, :update,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :review_comments, only: [:create, :destroy]
  end

end
