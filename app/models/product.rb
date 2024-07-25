class Product < ApplicationRecord
  belongs_to :category
  has_many :carts_products
  has_many :carts, through: :carts_products

  def self.ransackable_attributes(auth_object = nil)
    super + ["category_id", "name", "description", "price", "quantity_available"]
  end

  def self.ransackable_associations(auth_object = nil)
    super + ["category", "carts"]
  end
end
