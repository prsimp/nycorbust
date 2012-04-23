class PagesController < ApplicationController
  skip_before_filter :authorized_user, only: :home

  def home
    @items = Item.available.recent(3)
  end

  def admin
    @items = Item.recent(6)
  end
end
