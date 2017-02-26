Rails.application.routes.draw do
  get 'users/new'

  get 'users/show' => 'users#show'

  get 'users/edit' 

  get 'users/index' => 'users#index'

  root "pages#home"
  get 'pages/home'


  get 'pages/about'
  resources :users 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
