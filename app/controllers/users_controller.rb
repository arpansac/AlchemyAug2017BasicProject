class UsersController < ApplicationController
  
  def index
    byebug
  	@name = "Alchemy"
  
  	@users = User.all

    # earlier we used cookies, but then that was unsafe
    # if (!cookies[:user_id].blank?)
      # so we used session
    if (!session[:user_id].blank?)
      @signed_in_user = User.find(session[:user_id])
    end
  end

  def new
  	@user = User.new
  end



  def create

  	User.create(user_params)

  	redirect_to action: 'index'
  end

  def edit
  	@user = User.find(params[:id])

  end

  def update
  	@user = User.find(params[:id].to_i)

  	@user.update(user_params)
  	@user.save
  	redirect_to action: 'index'

  end

  def destroy
  	@user = User.find(params[:id].to_i)
  	@user.destroy
  	redirect_to action: 'index'
  end


  def sign_in

    # don't display sign in page in case user is already signed in
    if (!cookies[:user_id].blank?)
    # if (!session[:user_id].blank?)

      redirect_to action: 'index'
    end

  end

  def create_session
    # finding user who has signed in
    user = User.find_by(
      email: params[:email],
      password: params[:password]
      )

    # if user found then set the session variable (earlier we were
      # setting cookies)
    if !user.nil?
      # cookies[:user_id] = user.id
      session[:user_id] = user.id
    end

    redirect_to action: 'index'

  end

  def sign_out
    # removing the key user_id from session hash
    # cookies.delete(:user_id)
    # session.delete(:user_id)

    redirect_to action: 'index'
  end



  private
  def user_params
  	params.require(:user).permit(:name, :age, :email, :password)
  end


end








