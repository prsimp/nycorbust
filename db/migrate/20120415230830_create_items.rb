class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :description
      t.integer :category_id
      t.decimal :price, precision: 8, scale: 2
      t.string  :url

      t.timestamps
    end

    add_index :items, :category_id
  end
end
