class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  # Other model code...

  def self.ransackable_associations(auth_object = nil)
    ["user", "order_items", "products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["status", "total_price", "gst", "pst", "hst", "total_with_tax", "created_at"]
  end
end
