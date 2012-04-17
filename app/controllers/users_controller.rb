class UsersController < ApplicationController
  #TODO: Clean out kruft from rails g (CSS, JS etc.)
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User succesffully updated!"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "New User Created!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:success] = "#{user.email} successfully deleted."
    redirect_to users_path
  end
end
