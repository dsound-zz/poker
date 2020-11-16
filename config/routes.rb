Rails.application.routes.draw do
  get 'games/home'
  resources :games
  resources :players 
  resources :banks 
  root 'games#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
