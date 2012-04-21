class Category < ActiveRecord::Base
  has_many :items

  attr_accessible :name

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Returns true if a category has more than one item
  def self.has_many_items?(category_id)
    Category.find(category_id).items.count > 1
  end

end
