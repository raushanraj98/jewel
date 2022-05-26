Rails.application.routes.draw do
  root'pages#home'
  get'/login', to: 'sessions#new'
  post'/login', to: 'sessions#create'
  get'/logout', to: 'sessions#destroy'
  resources :items
end
