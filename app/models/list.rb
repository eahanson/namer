# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  title      :text             not null
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  creator    :string(255)      not null
#

class List < ActiveRecord::Base
  before_create :generate_slug
  validates :creator, :title, presence: true

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = SecureRandom.hex(10)
  end
end
