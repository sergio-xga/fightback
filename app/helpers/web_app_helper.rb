module WebAppHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    unless logged_in?
      redirect_to root_path, alert: "You must be logged in to access this section"
    end
  end
end