class PriceHistory < ApplicationRecord
  belongs_to :product

  # Define the attributes that are searchable
  def self.ransackable_attributes(auth_object = nil)
    ["changed_at", "created_at", "id", "new_price", "old_price", "product_id", "updated_at"]
  end
end
