class Product < ApplicationRecord
  belongs_to :category

  scope :newly_added, -> { where('created_at >= ?', 3.days.ago) }
  scope :recently_updated, -> { where('updated_at >= ?', 3.days.ago) }
  # Define the associations that are searchable
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end

  # Define the attributes that are searchable
  def self.ransackable_attributes(auth_object = nil)
    ["back_img", "category_id", "created_at", "description", "front_img", "id", "leftside_img", "name", "price", "quantity_available", "rightside_img", "updated_at"]
  end
end
