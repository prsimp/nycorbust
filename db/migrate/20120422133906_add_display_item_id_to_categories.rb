class AddDisplayItemIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :display_item_id, :integer

  end
end
