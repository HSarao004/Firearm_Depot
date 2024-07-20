class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :orders
  has_one :user_info, dependent: :destroy
  has_one :cart, dependent: :destroy
  accepts_nested_attributes_for :user_info

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
