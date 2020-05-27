class UsersController < ApplicationController
  def index
    @users = User.order(date_joined: :asc)
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      head :not_found
      return
    end
  end

  def login_form
    @user = User.new
  end


  def login
    username = params[:user][:username]
    user = User.find_by(username: username)
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as returning user #{username}"
      redirect_to root_path
      return
    elsif User.new(username: username, date_joined: Date.today).valid?
      user = User.create(username: username, date_joined: Date.today)
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as new user #{username}"
      redirect_to root_path
      return
    else
      flash[:warning] = "Unable to login: username must not be empty"
      redirect_to login_path
      return
    end
  

  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out."
    redirect_to root_path
    return
  end

end
