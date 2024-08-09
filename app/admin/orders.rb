# app/admin/orders.rb
ActiveAdmin.register Order do
  permit_params :user_id, :total_price, :gst, :pst, :hst, :status, :stripe_payment_id, :tax_id

  index do
    selectable_column
    id_column
    column :user
    column :total_price
    column :gst
    column :pst
    column :hst
    column :total_with_tax
    column :status
    column :created_at
    column :tax
    actions
  end

  filter :user
  filter :total_price
  filter :gst
  filter :pst
  filter :hst
  filter :status
  filter :created_at
  filter :tax

  form do |f|
    f.inputs do
      f.input :user
      f.input :total_price
      f.input :gst
      f.input :pst
      f.input :hst
      f.input :status, as: :select, collection: Order::VALID_STATUSES
      f.input :tax
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :total_price
      row :gst
      row :pst
      row :hst
      row :total_with_tax
      row :status
      row :stripe_payment_id
      row :tax
      row :created_at
      row :updated_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column :product
        column :quantity
        column :price_at_purchase
        column :total_price do |item|
          number_to_currency(item.total_price)
        end
      end
    end
  end
end
