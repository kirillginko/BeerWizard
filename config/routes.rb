Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: %i(show edit)
  resources :beers do
    resources :reviews, only: [:new, :create, :index, :show]
    resources :locations, only: [:index, :show ]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
