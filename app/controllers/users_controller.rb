class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :verify_qualified_user, only: :show
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

  def verify_qualified_user
    redirect_to(root_url) unless params[:id] == current_user.id.to_s
  end
end
