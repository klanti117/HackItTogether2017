module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

# def forget(user)
#     user.forget
#     cookies.delete(:user_id)
#     cookies.delete(:remember_token)
#   end

def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end



def logged_in?
    !current_user.nil?
  end

  def log_out
    # forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user)
    user == current_user
    if user && user.authenticated?
      log_in user
      # @current_user = user
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end

end