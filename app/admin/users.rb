ActiveAdmin.register User do
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :created_at
    end

    panel "Orders" do
      table_for user.orders do
        column "Order ID", :id
        column "Order Date", :created_at
        column "Total Price (Before Tax)", :total_price do |order|
          number_to_currency(order.total_price)
        end
        column "GST", :gst do |order|
          number_to_currency(order.gst)
        end
        column "PST", :pst do |order|
          number_to_currency(order.pst)
        end
        column "HST", :hst do |order|
          number_to_currency(order.hst)
        end
        column "Total Price (With Tax)", :total_with_tax do |order|
          number_to_currency(order.total_with_tax)
        end
        column "Order Items" do |order|
          ul do
            order.order_items.each do |item|
              li "#{item.product.name} - Quantity: #{item.quantity} - Price: #{number_to_currency(item.price_at_purchase)}"
            end
          end
        end
      end
    end
  end

  filter :email
  filter :created_at
end
