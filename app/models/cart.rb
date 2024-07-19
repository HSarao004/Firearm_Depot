class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :cartable, polymorphic: true
  belongs_to :product, optional: true

  validates :quantity, numericality: { greater_than: 0 }
end
