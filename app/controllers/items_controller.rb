class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @item.build_images(@item.item_images.count)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:success] = "#{@item.name} successfully updated."
      redirect_to @item
    else
      render 'edit'
    end
  end

  def new
    @item = Item.new
    @item.build_images(@item.item_images.count)
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:success] = @item.name + " successfully added."
      redirect_to @item
    else
      @item.rebuild_images
      render 'new'
    end
  end

  def destroy
    item = Item.find(params[:id]).destroy
    flash[:success] = "#{item.name} deleted."
    redirect_to 'index'
  end
end
