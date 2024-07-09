class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  # Define the attributes that are searchable
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_id", "price", "product_id", "quantity", "updated_at"]
  end
end
