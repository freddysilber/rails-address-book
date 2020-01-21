Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users
  resources :contacts # later, we can nest a route for notes to a contact?
  # resources :contacts, only: [:index, :show, :new, :create, :edit, :update]
  
  # get 'contacts/:id/edit', to: 'contacts#edit', as: :edit_contact
  # patch 'contacts/:id', to: 'contacts#update'
  resources :sessions

  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
	
	get '/logout' => 'sessions#destroy'
end
