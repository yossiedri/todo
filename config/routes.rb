Todo::Application.routes.draw do
  

  resources :todotasks
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users, :only => [:new,:create,:show,:edit,:update]

  root :to => 'sessions#new'

  match '/register',:to => 'users#new'
  match '/login',  :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'

end
