Rails.application.routes.draw do
  root 'users#index'

  get '/auth/:provider/callback' => 'sessions#create'

  resources :users
  resources :contacts
  resources :sessions

  resources :accounts do
    resources :contacts
  end
  
  resources :projects do
    resources :tasks
  end

  resources :tasks

  get '/signin' => 'sessions#new'
	get '/logout' => 'sessions#destroy'
  post '/signin' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
end
