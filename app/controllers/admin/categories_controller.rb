class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:success] = "#{@category.name} updated."
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "#{@category.name} category created."
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end
end
