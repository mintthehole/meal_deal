class AddItemCategoryToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_category_id, :integer
    remove_column :items, :item_type
  end
end
