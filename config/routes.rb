Rails.application.routes.draw do
  root 'teams#index'
  get 'conventions/search', to: 'conventions#search'
  get 'games/search', to: 'games#search'
  get 'matches/search', to: 'matches#search'
  get 'participations/search', to: 'participations#search'
  get 'players/search', to: 'players#search'
  get 'teams/search', to: 'teams#search'
  resources :games
  resources :teams
  resources :players
  resources :conventions
  resources :matches
  resources :participations
end
