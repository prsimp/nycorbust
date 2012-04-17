class Category < ActiveRecord::Base
  has_many :items

  attr_accessible :name

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
