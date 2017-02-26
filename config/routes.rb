Rails.application.routes.draw do
  get 'items/edit'

  get 'items/show'

  get 'users/new'

  get 'users/show' => 'users#show'

  get 'users/edit' 

  get 'users/index' => 'users#index'

  root "pages#home"
  get 'pages/home'


  get 'pages/about'
  resources :users 

  get 'items/new'

  get 'items/show'
  get 'items/edit'
  get 'items/index'

  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
