ActiveAdmin.register Order do
  index do
    selectable_column
    id_column
    column :user
    column :total_price
    column :gst
    column :pst
    column :hst
    column :total_with_tax
    column :created_at
    column :status
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :total_price
      row :gst
      row :pst
      row :hst
      row :total_with_tax
      row :created_at
      row :status
    end

    panel "Order Items" do
      table_for order.order_items do
        column :product
        column :quantity
        column :price_per_item do |item|
          number_to_currency(item.price_at_purchase)
        end
        column :total_price do |item|
          number_to_currency(item.price_at_purchase * item.quantity)
        end
      end
    end
  end
end
