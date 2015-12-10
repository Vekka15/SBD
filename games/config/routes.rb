Rails.application.routes.draw do
  root 'teams#index'
  resources :games
  resources :teams
  resources :players
  resources :conventions
  resources :matches
  resources :participations
  resources :players do
    resources :participations
  end
end
