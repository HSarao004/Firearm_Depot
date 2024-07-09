class Category < ApplicationRecord
  has_many :products
  has_many :accessories

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
