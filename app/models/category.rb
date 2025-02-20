class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true, length: { maximum: 255 }

  def self.ransackable_associations(auth_object = nil)
    ["products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
