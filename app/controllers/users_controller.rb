class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
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
    else
      user = User.create(username: username)
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as new user #{username}"
    end
  
    redirect_to root_path
    return
  end

end
