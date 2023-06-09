class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user
  helper_method :current_creator
  before_action :require_login

  private

  def auth
    @auth ||= Authenticator.new(session)
  end

  # NOTE: delegate を使って Authenticator に処理を委譲することもできるが、見通しの良さを重視している。
  def login(user)
    auth.login(user)
  end

  def logout
    auth.logout
  end

  def logged_in?
    auth.logged_in?
  end

  def current_user
    @current_user ||= auth.current_user
  end

  def current_creator
    @current_creator ||= current_user&.creator
  end

  def current_customer
    @current_customer ||= current_user&.customer
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
