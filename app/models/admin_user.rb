# app/models/admin_user.rb
class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
end
