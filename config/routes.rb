Rails.application.routes.draw do
  get 'friends/index'

  get 'friends/destroy'

  resources :friend_requests
  devise_for :users
  resources :users, only: [:show] do
    collection do
      get 'search', to: 'users#search'
    end
  end

  root 'static_pages#welcome'
  resources :posts


  get '/about' => 'static_pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
