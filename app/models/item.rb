class Item < ActiveRecord::Base
  belongs_to :category
  has_many :item_images, :dependent => :destroy

  accepts_nested_attributes_for :item_images, reject_if: :all_blank, allow_destroy: true

  attr_accessible :name,
                  :description,
                  :price,
                  :url,
                  :category_id,
                  :category_name,
                  :primary_image,
                  :item_images_attributes

  has_attached_file :primary_image, { styles: {
                                        thumb:  "100x100",
                                        small:  "130x96",
                                        medium: "290x214",
                                        large:  "610x450" },
                                    }.merge(PAPERCLIP_STORAGE_OPTIONS)

  validates :name, :category_id, :description, :price,
    presence: true
  validates :name,
    uniqueness: { case_sensitive: false },
    length: { maximum: 45 }
  validates :price,
    numericality: { greater_than: 0 }
  validates_attachment_presence :primary_image
  validates_attachment_size :primary_image,
    less_than: 3.megabytes

  def category_name
    category.try(:name)
  end

  def category_name=(name)
    self.category = Category.find_or_create_by_name(name)
  end

  def build_item_images
    images_to_build = 3 - self.item_images.count
    images_to_build.times { self.item_images.build }
  end

  def rebuild_item_images
    self.item_images.destroy_all
    self.build_images(self.item_images.count)
  end

  def has_many_images?
    self.item_images.count > 0
  end

  def all_images(size = :small)
    images = Array.new
    images << self.primary_image(size)
    if self.has_many_images?
      self.item_images.each do |image|
        images << image.photo(size)
      end
    end

    images
  end

  def self.recently_added(num)
    Item.order('created_at desc').limit(num)
  end

end
