class UserInfo < ApplicationRecord
  belongs_to :user

  validates :street, :city, :province, :postal_code, presence: true
  validates :card_number, :expiry, :cvv, presence: true
end
