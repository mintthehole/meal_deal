ActiveAdmin.register Order do

  index do
    column :user_name do |order|
      order.user.email
    end
    column :phone_no do |order|
      order.user.phone_no
    end
    column :building do |order|
      order.user.building.name
    end
    column :order_items do |order|
      order.item_with_quantity
    end
    column :total_price
    column :order_date do |order|
      order.created_at.strftime("%d %b %Y")
    end
  end

  csv do
    column :user_name do |order|
      order.user.email
    end
    column :phone_no do |order|
      order.user.phone_no
    end
    column :building do |order|
      order.user.building.name
    end
    column :order_items do |order|
      order.item_with_quantity
    end
    column :total_price
    column :order_date do |order|
      order.created_at.strftime("%d %b %Y")
    end
  end

end
