class ContactController < ApplicationController
  before_filter :check_message, only: :create
  skip_before_filter :authorized_user

  def new
  end

  def create
    ContactForm.inquiry(params).deliver
    flash[:success] = "Message Sent!"
    redirect_to root_url
  end

  def check_message
    if blank_required_params?
      flash.now[:warning] = "All fields are required. Please try again."
      render 'new' and return false
    end
  end

  def blank_required_params?
    missing_params = false
    [:name,:email,:subject,:message].each  do |key|
      missing_params ||= params[key].empty?
    end

    missing_params
  end
end
