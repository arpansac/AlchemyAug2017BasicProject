Rails.application.routes.draw do
	# preference of urls is top to bottom

	# mapping a url to the controller#action
	get '/posts' => "posts#index"

	# same url but different methods for routing to different actions
	get "/users" => "users#index"
	post "/users" => "users#create"

	# same patter of 3 urls, different request methods and actions
	get "/users/new" => "users#new"
	get "/users/:id" => "users#edit"
	delete "/users/:id" => "users#destroy"

	# request type patch to update the user object
	patch "/users/:id/update" => "users#update"
	

	get "application/hello_world"
end
