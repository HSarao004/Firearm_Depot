class Category < ApplicationRecord
  # Associations
  has_many :products

  # Other model code...

  def self.ransackable_associations(auth_object = nil)
    ["products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
