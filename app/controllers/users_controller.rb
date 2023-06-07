class UsersController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(params))
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
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
