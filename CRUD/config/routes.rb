Rails.application.routes.draw do
	
  
	get '/users/new'
	post '/users/create'
	resources :users
	
	
	get 'sessions/new'
  	get 'sessions/create'
  	get 'sessions/destroy'
	get 'sessions/sign_in', to: 'sessions#new'
	post 'sessions/sign_in', to: 'sessions#create'
	delete 'sessions/sign_out', to: 'sessions#destroy'
	
	
	root 'board#index'
	get '/board', to: 'board#index'
	post '/create', to: 'board#create'
	get '/edit/:id', to: 'board#edit'
	post '/update', to:'board#update'
	get '/delete/:id', to: 'board#delete'
	get '/post/:id', to: 'board#post'
	
	
	post '/post/:post_id/create', to: 'comments#create'
	get '/post/:post_id/edit/:comment_id', to: 'comments#edit'
	post '/post/:post_id/update/:comment_id', to: 'comments#update'
	get '/post/:post_id/delete/:comment_id', to: 'comments#delete'
	
	
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
