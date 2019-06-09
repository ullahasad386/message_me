class UsersController < ApplicationController
  before_action :signed_up, only: [:new, :create]

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the MessageMe app #{@user.username}"
      redirect_to root_path(@user)
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def signed_up
    if logged_in?
      flash[:danger] = "You've already signed up for MessageMe"
      redirect_to root_path
    end

  end

end
