Rails.application.routes.draw do
	resources :tasks
	resources :users
    root 'home#index'
	get    '/register',  to: 'users#register'
	post   '/register',  to: 'users#create'
	get    '/login',  to: 'sessions#login'
	post   '/login',  to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
