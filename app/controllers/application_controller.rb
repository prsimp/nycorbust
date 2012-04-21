class ApplicationController < ActionController::Base
  before_filter :authorized_user

  protect_from_forgery

  include SessionsHelper

  def authorized_user
    if !signed_in?
      flash[:message] = "You do not have permission to access that page."
      redirect_to root_path and return false
    end
  end
end
