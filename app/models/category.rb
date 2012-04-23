class Category < ActiveRecord::Base
  has_many :items

  default_scope order("name asc")

  attr_accessible :name, :display_item_id

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Returns true if a category has more than one item
  def self.has_many_items?(category_id)
    Category.find(category_id).items.count > 1
  end

  def category_image(style = nil)
    begin
      item = Item.find(display_item_id)
    rescue ActiveRecord::RecordNotFound
      item = Item.where("category_id = ?", self.id).first
    end
    item.primary_image(style)
  end

end
