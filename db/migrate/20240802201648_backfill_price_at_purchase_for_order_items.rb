class BackfillPriceAtPurchaseForOrderItems < ActiveRecord::Migration[6.0]
  def up
    OrderItem.find_each do |order_item|
      unless order_item.price_at_purchase
        order_item.update(price_at_purchase: order_item.product.price)
      end
    end
  end

  def down
    # No need to revert this change
  end
end
