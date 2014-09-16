class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.string :total_price

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
