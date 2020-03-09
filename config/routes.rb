Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
    resources :users,only: [:show,:index,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#following', as:'follows'
      get 'followers' => 'relationships#follower' , as: 'followers'
    end
  resources :books do
  	resource :favorites, only:[:create,:destroy]
  	resource :book_comments, only:[:create, :destroy]

  end
    get 'search' => 'search#search', as: 'search'
 end