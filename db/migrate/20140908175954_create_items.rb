class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.string :item_type

      t.timestamps
    end
  end
end
