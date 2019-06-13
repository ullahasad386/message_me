class UsersController < ApplicationController
  before_action :signed_up, only: [:new, :create]
  before_action :require_user, only: [:index]
  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the MessageMe app #{@user.username}"
      redirect_to chatroom_path(@user)
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :avatar) 
  end

  def signed_up
    if logged_in?
      flash[:danger] = "You've already signed up for MessageMe"
      redirect_to chatroom_path
    end

  end

end
