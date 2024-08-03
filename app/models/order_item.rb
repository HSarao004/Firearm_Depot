class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_create :set_price_and_tax_rates

  def set_price_and_tax_rates
    self.price_at_purchase = product.price
    tax = order.tax
    self.gst_rate = tax.gst_rate
    self.pst_rate = tax.pst_rate
    self.hst_rate = tax.hst_rate
  end

  def total_price
    self.price_at_purchase * self.quantity
  end
end
