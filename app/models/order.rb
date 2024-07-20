class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items,dependent: :destroy
  belongs_to :tax
  validates :total_price, presence: true
  validates :gst, :pst, :hst, :total_with_tax, presence: true
end
