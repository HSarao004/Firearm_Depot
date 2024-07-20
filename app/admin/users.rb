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
      row :id
      row :email
      row :created_at
    end

    panel "Orders" do
      table_for user.orders do
        column :id
        column :total_price
        column :gst
        column :pst
        column :hst
        column :total_with_tax
        column :created_at
        column "Order Items" do |order|
          table_for order.order_items do
            column :product
            column :quantity
            column :price_per_item do |item|
              number_to_currency(item.product.price)
            end
            column :total_price do |item|
              number_to_currency(item.product.price * item.quantity)
            end
          end
        end
      end
    end
  end
end
