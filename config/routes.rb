Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :contacts
  resources :sessions
  resources :accounts do
    resources :contacts
  end

  resources :projects

  get '/signin' => 'sessions#new'
	get '/logout' => 'sessions#destroy'
  post '/signin' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
end
