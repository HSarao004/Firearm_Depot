class UserInfo < ApplicationRecord
  belongs_to :user

  validates :street, presence: true, length: { maximum: 255 }
  validates :city, presence: true, length: { maximum: 255 }
  validates :province, presence: true, length: { maximum: 255 }
  validates :postal_code, presence: true, format: { with: /\A[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d\z/ }
end
