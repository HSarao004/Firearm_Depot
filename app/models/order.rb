class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  # Validations
  validates :user, presence: true
  validates :total_price, presence: true
  validates :gst, :pst, :hst, presence: true
  validates :stripe_payment_id, presence: true, if: :paid?

  # Methods for ransack gem
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
