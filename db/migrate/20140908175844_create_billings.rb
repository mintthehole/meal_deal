class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.string :name

      t.timestamps
    end
  end
end
