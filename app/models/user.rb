class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Devise handles password encryption and authentication, so no need for has_secure_password
  # has_secure_password

  has_many :orders
  has_one :user_info, dependent: :destroy
  has_many :carts
  accepts_nested_attributes_for :user_info

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
