Rails.application.routes.draw do
	# preference of urls is top to bottom
	root 'users#index'


	# mapping a url to the controller#action
	get '/posts' => "posts#index"

	# we will remove these routes and replace them with resources :users
	
	# get "/users" => "users#index"
	# post "/users" => "users#create"

	# get "/users/new" => "users#new"

	# # given a name to the route, show rake routes after this
	# # have taken singular because meaningfully we are working on a single user
	# # and users_path is for /users
	# get "/users/:id/edit" => "users#edit", as: :edit_user
	
	# delete "/users/:id" => "users#destroy"

	# # put a name using as:
	# the name is accessed using user_path
	# patch "/users/:id" => "users#update", as: :user
	
	get '/users/sign_in' => "users#sign_in", as: :user_sign_in
	post '/users/create_session' => "users#create_session", as: :create_session
	delete '/users/sign_out' => "users#sign_out", as: :user_sign_out
	resources :users

	get "application/hello_world"
end














