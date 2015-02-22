Rails.application.routes.draw do

  resources :genres

  root  'movies#index'
  get   'signup' => 'users#new'
  get   'signin' => 'sessions#new'

  resources :users
  resource  :session

  resources :movies do
    resources :reviews
    resources :favorites
  end

end
