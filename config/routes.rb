Rails.application.routes.draw do

  resources :genres

  root  'movies#index'
  get   'signup' => 'users#new'
  get   'signin' => 'sessions#new'

  resources :users
  resource  :session

  get   'movies/:scope' => 'movies#index', constraints: { scope: /hits|flops|upcoming|recent/ },
        as: :filtered_movies

  resources :movies do
    resources :reviews
    resources :favorites
  end

end
