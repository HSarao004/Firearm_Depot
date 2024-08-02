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
    actions
  end

  show do
    attributes_table do
      row :user
      row :total_price
      row :gst
      row :pst
      row :hst
      row :total_with_tax
      row :created_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column :product
        column :quantity
        column :price_at_purchase do |item|
          number_to_currency(item.price_at_purchase)
        end
        column :gst_rate
        column :pst_rate
        column :hst_rate
        column :total_price do |item|
          number_to_currency(item.total_price)
        end
      end
    end
  end

  filter :user
  filter :total_price
  filter :gst
  filter :pst
  filter :hst
  filter :total_with_tax
  filter :created_at
end
