class Accessory < ApplicationRecord
  belongs_to :category
  has_many :carts, as: :cartable


  validates :name, presence: true
  validates :price, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "price", "quantity_available", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
