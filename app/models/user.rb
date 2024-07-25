class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :orders,dependent: :destroy
  has_one :user_info, dependent: :destroy
  has_one :cart, dependent: :destroy
  accepts_nested_attributes_for :user_info

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
