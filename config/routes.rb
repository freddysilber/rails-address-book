Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  # root 'users#index'
  resources :users
  resources :contacts # later, we can nest a route for notes to a contact?
  resources :sessions
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
	
	get '/logout' => 'sessions#destroy'
end
