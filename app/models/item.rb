class Item < ActiveRecord::Base
  belongs_to :category
  has_many :item_images, :dependent => :destroy

  accepts_nested_attributes_for :item_images, reject_if: :all_blank, allow_destroy: true

  attr_accessible :name, :category_id, :description, :price, :url, :category_name,
                  :item_images_attributes, :primary_image_id

  validates :name, :category_id, :description, :price, presence: true
  validates :name, uniqueness: { case_sensitive: false },
  length: { maximum: 45 }
  validates :price, numericality: { greater_than: 0 }
  validates :item_images, presence: { message: "Items must have at least one image." }

  # Returns 'num' number of recently added items
  def self.recently_added(num)
    Item.order('created_at desc').limit(num)
  end

  # Getters and Setters for virtual element category_name
  def category_name
    category.try(:name)
  end

  def category_name=(name)
    self.category = Category.find_or_create_by_name(name)
  end

  # Builds item images up to a maximum of 4
  def build_images(current_images = 0)
    images_to_build = 4 - current_images
    images_to_build.times { self.item_images.build }
  end

  # Removes non-persisted ItemImages and recreates ItemImages on save failure
  def rebuild_images
    self.item_images.destroy_all
    self.build_images(self.item_images.count)
  end

  # Gets the primary image for an item
  def display_image(size = :large)
    self.item_images.first.photo(size) # temporary
    # ItemImage.where(item_id = self.id, display: true).photo(size)
  end

  def has_many_images?
    self.item_images.count > 1
  end

  def self.sample_by_category(categories)
    items = Hash.new
    categories.each do |cat|
      item = Item.find_by_category_id(cat.id)
      items[cat.id] = item unless item.nil?
    end

    items
  end

end
