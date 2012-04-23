class CategoriesController < ApplicationController
  skip_before_filter :authorized_user
  before_filter :no_available_items, only: :show

  def index
    @categories = Category.with_available_items
  end

  def show
    @category = Category.find(params[:id])
  end

  protected

  def no_available_items
    if Category.find(params[:id]).items.available.count == 0
      flash[:alert] = "That category has no available items."
      redirect_to categories_path and return false
    end
  end
end
