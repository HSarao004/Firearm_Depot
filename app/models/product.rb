class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :price_histories

  # Define the associations that are searchable
  def self.ransackable_associations(auth_object = nil)
    ["category", "order_items", "price_histories"]
  end

  # Define the attributes that are searchable
  def self.ransackable_attributes(auth_object = nil)
    ["back_img", "category_id", "created_at", "description", "front_img", "id", "leftside_img", "name", "price", "quantity_available", "rightside_img", "updated_at"]
  end
end
