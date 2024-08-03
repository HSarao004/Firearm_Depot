class StaticPage < ApplicationRecord
  before_validation :generate_slug

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true, length: { maximum: 255 }

  def to_param
    slug
  end

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "slug", "title", "updated_at"]
  end

  private

  def generate_slug
    self.slug ||= title.parameterize
  end
end
