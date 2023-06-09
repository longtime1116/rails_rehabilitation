class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = SetupUserService.call(user_params(params))
    if @user.persisted?
      login(@user)
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
