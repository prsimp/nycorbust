class ItemsController < ApplicationController
  skip_before_filter :authorized_user

  def index
    @items = Item.available.by_name
  end

  def show
    @item = Item.find(params[:id])
  end
end
