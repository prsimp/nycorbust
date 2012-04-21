class PagesController < ApplicationController
  skip_before_filter :authorized_user, only: :home

  def home
    @items = Item.recently_added(3)
  end

  def admin
    @items = Item.recently_added(6)
  end
end
