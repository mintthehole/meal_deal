class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :item
      t.references :order
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
    add_index :order_items, :item_id
    add_index :order_items, :order_id
  end
end
