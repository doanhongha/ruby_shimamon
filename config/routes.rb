Rails.application.routes.draw do
  resources :tags
	resources :tasks
	resources :users
  resources :profiles
    root 'home#index'
	get    '/register',  to: 'users#register'
	post   '/register',  to: 'users#create'
	get    '/login',  to: 'sessions#login'
	post   '/login',  to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	get '/set_deadline/:id', to: 'tasks#set_deadline', as: :set_deadline
	get '/search', to: 'home#search'

	get '/404', to: 'errors#not_found'
	get '/422', to: 'errors#unacceptable'
	get '/500', to: 'errors#internal_error'

  # test sidekiq
  get '/test', to: 'tasks#test'
	#search tag
	get '/tag_search/:id', to: 'tags#tag_search', as: :tag_search

	#admin
	get '/admins/index', to: 'admins#index', as: :admin_index 
	get '/admins/user/:id', to: 'admins#user', as: :admin_user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
end
