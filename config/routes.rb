Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users
  resources :contacts
  resources :sessions
  # resources :accounts
  resources :accounts do
    resources :contacts
  end

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
	
	get '/logout' => 'sessions#destroy'
end
