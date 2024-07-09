class StaticPage < ApplicationRecord
  before_validation :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug ||= title.parameterize
  end
  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "slug", "title", "updated_at"]
  end

end
