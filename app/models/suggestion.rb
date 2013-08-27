# == Schema Information
#
# Table name: suggestions
#
#  id         :integer          not null, primary key
#  list_id    :integer          not null
#  contents   :text             not null
#  notes      :text
#  creator    :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Suggestion < ActiveRecord::Base
  validates :list_id, :contents, :creator, presence: true

  belongs_to :list
end
