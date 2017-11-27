Rails.application.routes.draw do
	resources :tasks
	resources :users
    root 'home#index'
	get    '/register',  to: 'users#register'
	post   '/register',  to: 'users#create'
	get    '/login',  to: 'sessions#login'
	post   '/login',  to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	get '/set_deadline/:id', to: 'tasks#set_deadline', as: :set_deadline
	get '/search', to: 'home#search'

	#admin
	get '/admins/index', to: 'admins#index', as: :admin_index 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
