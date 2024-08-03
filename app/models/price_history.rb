class PriceHistory < ApplicationRecord
  belongs_to :product

  validates :product_id, presence: true, numericality: { only_integer: true }
  validates :old_price, :new_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :changed_at, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["changed_at", "created_at", "id", "new_price", "old_price", "product_id", "updated_at"]
  end
end
