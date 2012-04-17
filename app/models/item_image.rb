class ItemImage < ActiveRecord::Base
  belongs_to :item

  has_attached_file :photo, { :styles => { :thumb  => "100x100",
                                           :small  => "130x96",
                                           :medium => "290x214",
                                           :large  => "610x450" },
                              :default_url => '/assets/default.jpg'
                            }.merge(PAPERCLIP_STORAGE_OPTIONS)


  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
end
