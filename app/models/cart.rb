class Cart < ApplicationRecord
  belongs_to :user
  has_many :carts_products
  has_many :products, through: :carts_products

  def self.ransackable_attributes(auth_object = nil)
    ["cartable_id", "cartable_type", "created_at", "id", "id_value", "product_id", "quantity", "total_after_tax", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "products"]
  end
end
