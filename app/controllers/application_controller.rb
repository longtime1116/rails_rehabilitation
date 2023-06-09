class ApplicationController < ActionController::Base
  helper_method :login?
  helper_method :current_user
  helper_method :current_creator

  private

  def auth
    @auth ||= Authenticator.new(session)
  end

  def login(user)
    auth.login(user)
  end

  def logout
    auth.logout
  end

  def login?
    auth.login?
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
end
