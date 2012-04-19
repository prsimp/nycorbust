module ItemsHelper

  def get_related_items(item)
    Item.where("category_id = ? AND id != ?", item.category_id, item.id).limit(6)
  end

end
