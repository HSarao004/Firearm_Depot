class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items,dependent: :destroy
  belongs_to :tax

end
