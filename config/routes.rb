Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: %i(show edit)
  resources :beers do
    member do
      put "like" => "beers#vote"
    end
    resources :reviews, only: [:create, :destroy, :edit, :update ]
    resources :locations, only: [:index, :show ]

  end
  resource :friendships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
