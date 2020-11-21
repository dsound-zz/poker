Rails.application.routes.draw do
  get 'games/home'
  get 'hands/deal', to: 'hands#deal'
  get 'hands/', to: 'hands#index' 
  get 'hands/beats/:game_id', to: 'hands#beats'
  resources :games
  resources :players 
  resources :banks 
  root 'games#home'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
