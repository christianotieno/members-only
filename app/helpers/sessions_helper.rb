module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.update_attribute(:remember_digest, Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64))
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_digest] = user.remember_digest
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      log_in user if user&.authenticate(cookies[:remember_token])
    end
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    cookies.delete(:remember_digest)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end
end
