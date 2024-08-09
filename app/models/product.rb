class Product < ApplicationRecord
  belongs_to :category
  has_many :carts_products
  has_many :carts, through: :carts_products
  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity_available, presence:     true,
                                 numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :category_id, presence: true, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "name", "description", "price", "quantity_available"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "carts"]
  end
end
