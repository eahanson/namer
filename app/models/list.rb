class List < ActiveRecord::Base
  before_create :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = SecureRandom.hex(10)
  end
end
