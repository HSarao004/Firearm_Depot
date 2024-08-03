class Order < ApplicationRecord
  belongs_to :user
  belongs_to :tax
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :tax_id, presence: true, numericality: { only_integer: true }
  validates :total_price, :gst, :pst, :hst, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[new paid shipped] }
  validates :stripe_payment_id, presence: true, if: :paid?

  def self.ransackable_associations(auth_object = nil)
    ["user", "order_items", "products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["status", "total_price", "gst", "pst", "hst", "total_with_tax", "created_at"]
  end

  def total_with_tax
    total_price + gst + pst + hst
  end

  def paid?
    status == 'paid'
  end

  def stripe_payment_details
    Stripe::Charge.retrieve(stripe_payment_id) if stripe_payment_id.present?
  rescue Stripe::InvalidRequestError => e
    Rails.logger.error "Stripe error while retrieving charge: #{e.message}"
    nil
  end
end
