# 支援サブドメインに位置するものとみなし、libに置く
class Authenticator
  def initialize(session)
    @session = session
  end

  def login(user)
    @session[:user_id] = user.id
  end

  def logout
    @session.delete(:user_id)
  end

  def login?
    @session[:user_id].present?
  end

  def current_user
    User.find_by(id: @session[:user_id]) if login?
  end
end
