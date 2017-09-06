class UsersController < ApplicationController
  
  def index
  	@name = "Alchemy"
    # initial commands
    # @users = User.where('age > ?', 20)
    # @users = User.where(age: 20)
    # @users = User.where('age > ?', 20)
  	@users = User.all
  end

  # action to render a page for creating a new user
  def new
    # we have passed an empty User class object to generate 
    # the form using rails form generators
  	@user = User.new
  end


  # action to receive data from form on new.html.erb
  def create   
    
    # we first did it like this
    # User.create(name: params[:name], age: params[:age].to_i, email: params[:email], password: params[:password])    
    
    # user params is a private method defined at the bottom
  	User.create(user_params)


    # redirects to a specific action
  	redirect_to action: 'index'
  end

  # similar to def new, it renders a page with the form to edit a user
  def edit
    # params[:id] is a url string parameter (something like /users/10)
  	@user = User.find(params[:id])

  end

  # updates the user using .update() method
  def update
  	@user = User.find(params[:id].to_i)

    # user_params just like the .create method
  	@user.update(user_params)
  	@user.save
  	redirect_to action: 'index'

  end

  # finds the user from the url parameter :id and destroys it
  def destroy
  	@user = User.find(params[:id].to_i)
  	@user.destroy
  	redirect_to action: 'index'
  end


  private
  # this method defines which all fields are allowed/permitted 
  # for the default .create() and .update() methods so that
  # an object might be created/updated directly by passing the params
  def user_params
  	params.require(:user).permit(:name, :age, :email, :password)
    # earlier params was a hash which looked like params = {name: "User1", email: "blah@gmail.com"...}
    # this now return params[:user] which is = {name: "User1", email: "blah@gmail.com"...}
  end


end








