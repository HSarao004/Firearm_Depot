class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :orders, dependent: :destroy
  has_one :user_info, dependent: :destroy
  has_one :cart, dependent: :destroy
  accepts_nested_attributes_for :user_info

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :encrypted_password, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :phone, presence: true, format: { with: /\A\+?[1-9]\d{1,14}\z/ }

  def is_admin?
    admin
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[orders]
  end
end
