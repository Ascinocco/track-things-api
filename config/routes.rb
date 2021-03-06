Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :things

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  put 'profile/update', to: 'users#update'
  delete 'profile/destroy', to: 'users#destroy'
end
