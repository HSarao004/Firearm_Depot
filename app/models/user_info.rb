class UserInfo < ApplicationRecord
  belongs_to :user

  validates :street, presence: true, length: { maximum: 255 }
  validates :city, presence: true, length: { maximum: 255 }
  validates :province, presence: true, length: { maximum: 255 }
  validates :postal_code, presence: true, format: { with: /\A[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d\z/ }
  validates :card_number, presence: true, length: { is: 16 }, numericality: { only_integer: true }
  validates :expiry, presence: true, format: { with: /\A(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})\z/ }
  validates :cvv, presence: true, length: { is: 3 }, numericality: { only_integer: true }
end
