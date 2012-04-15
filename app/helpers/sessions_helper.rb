module SessionsHelper

  def sign_in(user, remember_me_setting)
    if remember_me_setting
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
    current_user = user
  end

  def sign_out
    cookies.delete(:auth_token)
    current_user = nil
  end

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token])
  end

  def current_user=(user)
    @current_user = user
  end

  def signed_in?
    !current_user.nil?
  end
end
