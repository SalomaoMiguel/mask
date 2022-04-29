Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_for :admins, skip: [:registrations], controllers: {sessions: 'admins/sessions'}

  namespace :admin do 
    root to: "home#index"
    resources :admins
    resources :users, only: :index
    resources :posts, only: [:show, :index]
  end

  
  root to: "user/timeline#index"

  namespace :user do
     get 'profile', to: "profile#show"
     get 'potential_to_follow', to: "profile#potential_to_follow"
     get 'following', to: "profile#following"
     get 'followers', to: "profile#followers"
     resources :posts, only: :create

    #  post para seguidores
    post 'follow/:id', to: "subscriptions#follow", as: :follow
    #Deixar de seguir
    post 'unfollow/:id', to: "subscriptions#unfollow", as: :unfollow
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
