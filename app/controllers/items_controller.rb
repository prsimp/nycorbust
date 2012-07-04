class ItemsController < ApplicationController
  skip_before_filter :authorized_user

  def index
    @items = Item.available.order("category_id asc, name asc")
  end

  def show
    @item = Item.find(params[:id])
  end
end
