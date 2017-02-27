Rails.application.routes.draw do
  root 'items#index'

  get 'items/index' 

  get 'sessions/new'

  get 'users/items/edit'

  get 'users/items/show'

  get 'users/new'

  get 'users/show' => 'users#show'

  get 'users/edit' 

  get 'users/index' => 'users#index'

  get 'pages/home'


  get 'pages/about'
  resources :users
  

  resources :items

   get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
