class AddPhoneNoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_no, :string
    add_column :users, :building_id, :integer
  end
end
