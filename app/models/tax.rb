class Tax < ApplicationRecord
  has_many :orders

  validates :region, presence: true, length: { maximum: 255 }
  validates :gst_rate, :pst_rate, :hst_rate, presence:     true,
                                             numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "region", "gst_rate", "pst_rate", "hst_rate", "created_at", "updated_at"]
  end
end
