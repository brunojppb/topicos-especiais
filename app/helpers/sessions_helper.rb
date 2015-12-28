module SessionsHelper

  #Log in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #return the current logged-in user (if any)
  def current_user
    if user_id = session[:user_id]
      @current_user ||= Client.find_by(id: user_id)
    end
  end

  # Return true if the given user is the current user
  def current_user?(user)
    user == @current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Store the URL given by the user to redirect him after login
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

end
