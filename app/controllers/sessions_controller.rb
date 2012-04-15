class SessionsController < ApplicationController

  #TODO: Change these paths once admin panel is created
  def new
    flash[:message] = "You are already signed in."
    redirect_to admin_users_path if signed_in?
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user, params[:remember])
      flash[:success] = "Successfully signed in!"
      redirect_to admin_users_path
    else
      flash.now[:error] = "Invalid email/password combination. Please try again"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed out."
    redirect_to root_path
  end

end
