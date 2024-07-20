class Tax < ApplicationRecord
  has_many :orders

  def self.ransackable_attributes(auth_object = nil)
    ["id", "region", "gst_rate", "pst_rate", "hst_rate", "created_at", "updated_at"]
  end
end
