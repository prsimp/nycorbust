class CategoriesController < ApplicationController
  skip_before_filter :authorized_user

  def index
    #TODO: Scope this so it only shows Categories with Available Items
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
