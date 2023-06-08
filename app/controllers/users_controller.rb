class UsersController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    user = SetupUserService.call(user_params(params))
    render 'new' if user.nil?
    redirect_to user
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params(params)
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
