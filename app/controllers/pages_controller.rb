class PagesController < ApplicationController
  def home
    @items = Item.recently_added(3)
  end

  def admin
  end
end
