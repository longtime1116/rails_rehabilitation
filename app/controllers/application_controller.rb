class ApplicationController < ActionController::Base
  helper_method :login?
  helper_method :current_user
  helper_method :current_creator

  private

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def login?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_creator
    return unless current_user

    @current_creator ||= Creator.find_by(user_id: current_user.id)
  end
end
