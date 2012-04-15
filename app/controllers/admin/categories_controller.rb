class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    @category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:success] = @category.name + " updated."
      redirect_to categories_path
    else
      @categories = Category.all
      render 'edit'
    end
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "#{@category.name} category created."
      redirect_to categories_path
    else
      @categories = Category.all
      render 'new'
    end
  end
end
