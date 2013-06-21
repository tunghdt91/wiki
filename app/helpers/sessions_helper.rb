module SessionsHelper
	def active?
    current_user.active
  end

  def activation_in_user
    unless active?
      store_location
      redirect_to root_path, notice: "Permission Access. Your Account not active."
    end
  end

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
    
  end

  def signin_and_active(user,admin)
    sign_in admin
    redirect_to show_info_user_path(@user)   
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user? user
    user == current_user
  end

  def checked_admin?
    current_user.admin
  end

  def signed_in?
    !current_user.nil?
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to new_session_path, notice: "Please sign in."
    end
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def check_admin
    unless signed_in? && current_user.admin?
      flash[:errors] = "Only administrator can use it !"
     redirect_to root_url  
    
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default )
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
