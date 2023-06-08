class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      login(user)
      redirect_to user, flash: { info: 'ログインしました' }
    else
      flash.now[:danger] = 'ログインエラー！パスワードが正しくありません'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, flash: { info: 'ログアウトしました' }
  end
end
