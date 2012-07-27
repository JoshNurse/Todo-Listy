module Authentication
  def self.included(controller)
    controller.send :helper_method, :current_user, :logged_in?
  end

  def current_user_session
    @current_user_session ||= UserSession.find
  end
 
  def current_user
    @current_user ||= (current_user_session && current_user_session.record)
  end
  
  def logged_in?
    current_user ? true : false
  end

  def require_user
    unless logged_in?
      store_target_location
      flash[:notice] = 'You must be logged in to access that page.'
      redirect_to root_path
    end
  end

  def require_no_user
    if logged_in?
      store_target_location
      flash[:error] = 'You must be logged out to access that page.'
      redirect_to root_path
    end
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

private
  
  def store_target_location
    session[:return_to] = request.url
  end
end
