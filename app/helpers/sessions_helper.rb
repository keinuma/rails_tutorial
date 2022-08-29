module SessionsHelper
  def store_cookie(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def stored_user?
    !current_user.nil?
  end
end
