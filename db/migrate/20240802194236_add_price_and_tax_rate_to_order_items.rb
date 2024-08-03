class AddPriceAndTaxRateToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :price_at_purchase, :decimal, precision: 10, scale: 2
    add_column :order_items, :gst_rate, :decimal, precision: 5, scale: 2
    add_column :order_items, :pst_rate, :decimal, precision: 5, scale: 2
    add_column :order_items, :hst_rate, :decimal, precision: 5, scale: 2
  end
end
