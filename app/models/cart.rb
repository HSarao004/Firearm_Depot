class Cart < ApplicationRecord
  belongs_to :user
  has_many :carts_products
  has_many :products, through: :carts_products

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :total_after_tax, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def self.ransackable_attributes(auth_object = nil)
    ["cartable_id", "cartable_type", "created_at", "id", "id_value", "product_id", "quantity",
     "total_after_tax", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "products"]
  end
end
