class AddColumnVegToItems < ActiveRecord::Migration
  def change
    add_column :items, :veg, :boolean
  end
end
