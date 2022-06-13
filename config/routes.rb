Rails.application.routes.draw do
  root'items#index'
  get'/login', to: 'sessions#new'
  post'/login', to: 'sessions#create'
  get'/logout', to: 'sessions#destroy'
  resources :items
end
